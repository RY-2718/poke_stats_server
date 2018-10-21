require 'rails_helper'

RSpec.describe 'opp_poke request', type: :request do
  let!(:alice) { create(:alice) }
  let(:poke0) { create(:相手_0, :with_moves, user: alice) }
  let(:poke1) { create(:相手_1, :with_moves, user: alice) }
  let(:headers) do
    {
      authorization: "Bearer #{alice.create_token}",
      CONTENT_TYPE: 'application/json',
      ACCEPT: 'application/json',
    }
  end

  describe 'POST /api/v1/opp_pokes' do
    context '入力が正しいとき' do
      let(:params) do
        {
          poke_name: 'メガガルーラ',
          ability: 'おやこあい',
          item: 'ガルーラナイト',
          nature: 'むじゃき',
          memo: 'まだいるのこいつ',
          moves: %w[ねこだまし すてみタックル じしん れいとうビーム],
        }.to_json
      end

      it '201 createdが返ってくる' do
        post '/api/v1/opp_pokes', params: params, as: :json, headers: headers
        expect(response.status).to eq 201
      end

      it 'opp_pokeのレコードが増える' do
        expect do
          post '/api/v1/opp_pokes', params: params, as: :json, headers: headers
        end.to change(OppPoke, :count).by(1)
      end

      it 'opp_poke_moveのレコードが増える' do
        expect do
          post '/api/v1/opp_pokes', params: params, as: :json, headers: headers
        end.to change(OppPokeMove, :count).by(4)
      end
    end

    context('入力が不十分なとき') do
      let(:params) do
        {
          ability: 'おやこあい',
          item: 'ガルーラナイト',
          nature: 'むじゃき',
          memo: 'まだいるのこいつ',
          moves: %w[ねこだまし すてみタックル じしん れいとうビーム],
        }.to_json
      end

      it '400 bad requestが返ってくる' do
        post '/api/v1/opp_pokes', params: params, as: :json, headers: headers
        expect(response.status).to eq 400
      end

      it 'opp_pokeのレコードが増えない' do
        expect do
          post '/api/v1/opp_pokes', params: params, as: :json, headers: headers
        end.not_to change(OppPoke, :count)
      end

      it 'opp_poke_moveのレコードが増えない' do
        expect do
          post '/api/v1/opp_pokes', params: params, as: :json, headers: headers
        end.not_to change(OppPokeMove, :count)
      end
    end

    context '入力が不正なとき' do
      let(:params) do
        {
          poke_name: 'アネデパミ',
        }.to_json
      end

      it '200 OK以外が返ってくる' do
        post '/api/v1/opp_pokes', params: params, as: :json, headers: headers
        expect(response.status).not_to eq 200
      end

      it 'opp_pokeのレコードが増えない' do
        expect do
          post '/api/v1/opp_pokes', params: params, as: :json, headers: headers
        end.not_to change(OppPoke, :count)
      end

      it 'opp_poke_moveのレコードが増えない' do
        expect do
          post '/api/v1/opp_pokes', params: params, as: :json, headers: headers
        end.not_to change(OppPokeMove, :count)
      end
    end
  end

  describe 'PATCH /api/v1/opp_pokes/:id' do
    context '入力が正しいとき' do
      let(:params) do
        {
          item: 'こだわりスカーフ',
        }.to_json
      end

      let(:move_params) do
        {
          moves: %w[りゅうせいぐん あくのはどう だいもんじ ハイパーボイス],
        }.to_json
      end

      it '200 OKが返ってくる' do
        patch "/api/v1/opp_pokes/#{poke0.id}", params: params, as: :json, headers: headers
        expect(response.status).to eq 200
      end

      it '持ち物が変わる' do
        patch "/api/v1/opp_pokes/#{poke0.id}", params: params, as: :json, headers: headers
        expect(poke0.reload.full_info[:item]).to eq 'こだわりスカーフ'
      end

      it '技が変わる' do
        patch "/api/v1/opp_pokes/#{poke0.id}", params: move_params, as: :json, headers: headers
        expect(poke0.reload.full_info[:moves]).to eq %w[りゅうせいぐん あくのはどう だいもんじ ハイパーボイス]
      end
    end
  end
end
