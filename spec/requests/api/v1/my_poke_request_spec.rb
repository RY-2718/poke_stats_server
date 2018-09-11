require 'rails_helper'

RSpec.describe 'my_poke request', type: :request do
  let!(:alice) { create(:alice) }
  let(:headers) do
    {
      authorization: "Bearer #{alice.create_token}",
      CONTENT_TYPE: 'application/json',
      ACCEPT: 'application/json',
    }
  end

  describe 'POST /api/v1/my_pokes' do
    context '入力が正しいとき' do
      let(:params) do
        {
          poke_name: 'サザンドラ',
          ability: 'ふゆう',
          item: 'こだわりメガネ',
          nature: 'ひかえめ',
          effort: { h: 0, a: 0, b: 0, c: 252, d: 4, s: 252 },
          individual: { h: 31, a: 31, b: 31, c: 31, d: 31, s: 31 },
          moves: %w[りゅうせいぐん あくのはどう かえんほうしゃ ハイパーボイス],
        }.to_json
      end

      it '201 createdが返ってくる' do
        post '/api/v1/my_pokes', params: params, as: :json, headers: headers
        expect(response.status).to eq 201
      end

      it 'my_pokeのレコードが増える' do
        expect {
          post '/api/v1/my_pokes', params: params, as: :json, headers: headers
        }.to change(MyPoke, :count).by(1)
      end

      it 'my_poke_historyのレコードが増える' do
        expect {
          post '/api/v1/my_pokes', params: params, as: :json, headers: headers
        }.to change(MyPokeHistory, :count).by(1)
      end

      it 'my_poke_history_moveのレコードが増える' do
        expect {
          post '/api/v1/my_pokes', params: params, as: :json, headers: headers
        }.to change(MyPokeHistoryMove, :count).by(4)
      end
    end
  end
end
