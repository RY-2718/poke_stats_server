require 'rails_helper'

RSpec.describe 'my_poke request', type: :request do
  let!(:alice) { create(:alice) }
  let(:サザンドラ) { create(:サザンドラ, :with_latest_history, user: alice) }
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

    context ('入力が不十分なとき') do
      let(:params) do
        {
          poke_name: 'サザンドラ',
          ability: 'ふゆう',
          item: 'こだわりメガネ',
          effort: { h: 0, a: 0, b: 0, c: 252, d: 4, s: 252 },
          individual: { h: 31, a: 31, b: 31, c: 31, d: 31, s: 31 },
          moves: %w[りゅうせいぐん あくのはどう かえんほうしゃ ハイパーボイス],
        }.to_json
      end

      it '400 bad requestが返ってくる' do
        post '/api/v1/my_pokes', params: params, as: :json, headers: headers
        expect(response.status).to eq 400
      end

      it 'my_pokeのレコードが増えない' do
        expect {
          post '/api/v1/my_pokes', params: params, as: :json, headers: headers
        }.not_to change(MyPoke, :count)
      end

      it 'my_poke_historyのレコードが増えない' do
        expect {
          post '/api/v1/my_pokes', params: params, as: :json, headers: headers
        }.not_to change(MyPokeHistory, :count)
      end

      it 'my_poke_history_moveのレコードが増える' do
        expect {
          post '/api/v1/my_pokes', params: params, as: :json, headers: headers
        }.not_to change(MyPokeHistoryMove, :count)
      end
    end

    context '入力が不正なとき' do
      let(:params) do
        {
          poke_name: 'サザンドラ',
          ability: 'ふゆう',
          item: 'こだわりメガネ',
          nature: 'ひかえめ',
          effort: { h: 0, a: 0, b: 0, c: 252, d: 8, s: 252 },
          individual: { h: 31, a: 31, b: 31, c: 32, d: 31, s: 31 },
          moves: %w[りゅうせいぐん あくのはどう かえんほうしゃ ハイパーボイス],
        }.to_json
      end

      it '200 OK以外が返ってくる' do
        post '/api/v1/my_pokes', params: params, as: :json, headers: headers
        expect(response.status).not_to eq 200
      end

      it 'my_pokeのレコードが増えない' do
        expect {
          post '/api/v1/my_pokes', params: params, as: :json, headers: headers
        }.not_to change(MyPoke, :count)
      end

      it 'my_poke_historyのレコードが増えない' do
        expect {
          post '/api/v1/my_pokes', params: params, as: :json, headers: headers
        }.not_to change(MyPokeHistory, :count)
      end

      it 'my_poke_history_moveのレコードが増える' do
        expect {
          post '/api/v1/my_pokes', params: params, as: :json, headers: headers
        }.not_to change(MyPokeHistoryMove, :count)
      end
    end
  end

  describe 'PATCH /api/v1/my_pokes/:id' do
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
        patch "/api/v1/my_pokes/#{サザンドラ.id}", params: params, as: :json, headers: headers
        expect(response.status).to eq 200
      end

      it '持ち物が変わる' do
        patch "/api/v1/my_pokes/#{サザンドラ.id}", params: params, as: :json, headers: headers
        expect(サザンドラ.reload.full_info[:item]).to eq 'こだわりスカーフ'
      end

      it '技が変わる' do
        patch "/api/v1/my_pokes/#{サザンドラ.id}", params: move_params, as: :json, headers: headers
        expect(サザンドラ.reload.full_info[:moves]).to eq %w[りゅうせいぐん あくのはどう だいもんじ ハイパーボイス]
      end
    end
  end
end
