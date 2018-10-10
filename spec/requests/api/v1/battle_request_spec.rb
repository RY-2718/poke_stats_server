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

  describe '/api/v1/battles/:id' do
    it '200 OKが返ってくる' do
      get "/api/v1/battles/#{battle.id}", headers: headers
      expect(response.status).to eq 200
    end

    it 'いい感じのJSONが返ってくる' do
      get "/api/v1/battles/#{battle.id}", headers: headers
      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:id]).to eq battle.id
      expect(json[:win]).to eq battle.win
      expect(json[:my_rate]).to eq battle.my_rate
      expect(json[:opp_rate]).to eq battle.opp_rate
      expect(json[:my_pokes_in_battle]).not_to be_nil
      expect(json[:my_pokes_not_in_battle]).not_to be_nil
      expect(json[:opp_pokes_in_battle]).not_to be_nil
      expect(json[:opp_pokes_not_in_battle]).not_to be_nil
      poke = json[:my_pokes_in_battle].find { |p| p[:name] == 'サザンドラ' }
      expect(poke[:item]).to eq 'こだわりスカーフ'
    end
  end
end
