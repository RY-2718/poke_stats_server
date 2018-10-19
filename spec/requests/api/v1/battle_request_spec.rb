require 'rails_helper'

RSpec.describe 'battle request', type: :request do
  let!(:alice) { create(:alice) }
  let(:battle) { create(:battle, :with_pokes, user: alice) }
  let(:headers) do
    {
      authorization: "Bearer #{alice.create_token}",
      CONTENT_TYPE: 'application/json',
      ACCEPT: 'application/json',
    }
  end

  describe 'GET /api/v1/battles/:id' do
    it '200 OKが返ってくる' do
      get "/api/v1/battles/#{battle.id}", headers: headers
      expect(response.status).to eq 200
    end

    it 'いい感じのJSONが返ってくる' do
      get "/api/v1/battles/#{battle.id}", headers: headers
      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:id]).to eq battle.id
      expect(json[:win]).to eq battle.win
      expect(json[:memo]).to eq battle.memo
      expect(json[:my_rate]).to eq battle.my_rate
      expect(json[:opp_rate]).to eq battle.opp_rate
      expect(json[:opp_name]).to eq battle.opp_name
      expect(json[:my_pokes_in_battle]).not_to be_nil
      expect(json[:my_pokes_not_in_battle]).not_to be_nil
      expect(json[:opp_pokes_in_battle]).not_to be_nil
      expect(json[:opp_pokes_not_in_battle]).not_to be_nil
      poke = json[:my_pokes_in_battle].find { |p| p[:name] == 'サザンドラ' }
      expect(poke[:item]).to eq 'こだわりスカーフ'
    end
  end

  describe 'POST /api/v1/battles' do
    let(:params) {
      {
        win: true,
        memo: 'メモ',
        my_rate: 1500,
        opp_rate: 1500,
        opp_name: 'グリーン',
        my_pokes_in_battle: battle.my_pokes_in_battle.map(&:id),
        my_pokes_not_in_battle: battle.my_pokes_not_in_battle.map(&:id),
        opp_pokes_in_battle: battle.opp_pokes_in_battle.map(&:id),
        opp_pokes_not_in_battle: battle.opp_pokes_not_in_battle.map(&:id),
      }.to_json
    }

    it '201 Createdが返ってくる' do
      post '/api/v1/battles', params: params, as: :json, headers: headers
      expect(response.status).to eq 201
    end
  end

  describe 'PATCH /api/v1/battles/:id' do
    let(:params1) {
      {
        win: false.to_s,
      }.to_json
    }
    let(:params2) {
      {
        opp_pokes_in_battle: battle.opp_pokes_not_in_battle.map(&:id),
        opp_pokes_not_in_battle: battle.opp_pokes_in_battle.map(&:id),
      }.to_json
    }

    context 'battleモデルが持つ属性を変更するとき' do
      it '200 OKが返ってくる' do
        patch "/api/v1/battles/#{battle.id}", params: params1, as: :json, headers: headers
        expect(response.status).to eq 200
      end

      it '勝敗が変わる' do
        patch "/api/v1/battles/#{battle.id}", params: params1, as: :json, headers: headers
        expect(battle.reload.win).to eq false
      end
    end

    context 'battleモデルが持たない属性を変更するとき' do
      it '200 OKが返ってくる' do
        patch "/api/v1/battles/#{battle.id}", params: params2, as: :json, headers: headers
        expect(response.status).to eq 200
      end

      it '敵ポケモンの構成が変わる' do
        opp_pokes_in_battle_names = battle.opp_pokes_in_battle.map(&:name).to_set
        patch "/api/v1/battles/#{battle.id}", params: params2, as: :json, headers: headers
        expect(battle.reload.opp_pokes_not_in_battle.map(&:name).to_set).to eq opp_pokes_in_battle_names
      end
    end
  end
end
