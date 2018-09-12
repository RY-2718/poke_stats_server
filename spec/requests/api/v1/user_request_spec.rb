require 'rails_helper'

RSpec.describe 'User Request', type: :request do
  let!(:alice) { create(:alice) }
  let(:headers) { { authorization: "Bearer #{alice.create_token}" } }
  describe 'User RUD' do
    context 'get /api/v1/users/me' do
      it '200 OKが返ってくる' do
        get '/api/v1/users/me', headers: headers
        expect(response.status).to eq 200
      end

      it 'ユーザ名をJSONで取得する' do
        get '/api/v1/users/me', headers: headers
        json = JSON.parse(response.body)
        expect(json).to have_key('username')
        expect(json['username']).to eq alice.username
      end
    end
  end

  context 'patch /api/v1/users/me' do
    let(:params) { { username: 'ありす' } }
    it '204 No Contentが返ってくる' do
      patch '/api/v1/users/me', params: params, headers: headers
      expect(response.status).to eq 204
    end

    it 'usernameを変更する' do
      old_name = alice.username
      patch '/api/v1/users/me', params: params, headers: headers
      expect(alice.reload.username).not_to eq old_name
    end
  end

  context 'delete /api/v1/users/me' do
    it '204 No Contentが返ってくる' do
      delete '/api/v1/users/me', headers: headers
      expect(response.status).to eq 204
    end

    it 'ユーザ数を1減らす' do
      expect { delete('/api/v1/users/me', headers: headers) }.to change(User, :count).by(-1)
    end
  end
end
