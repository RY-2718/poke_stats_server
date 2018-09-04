require 'rails_helper'

RSpec.describe 'Application', type: :request do
  class TestController < ApplicationController
    before_action :jwt_authenticate
    def index
      render nothing: true
    end
  end

  before do
    Rails.application.routes.draw do
      get '/auth_test', to: 'test#index' # rubocop:disable Rails/HttpPositionalArguments
    end
  end

  describe '#jwt_authenticate' do
    let!(:alice) { create(:alice) }
    let(:alg) { 'HS256' }
    context 'トークンが正常な場合' do
      it '認証が通る' do
        token = alice.user_tokens.create(token: alice.create_token(exp: Time.zone.now + 1.day, alg: alg))
        headers = {
          Authorization: "Bearer #{token.token}"
        }
        get '/auth_test', headers: headers
        expect(response.status).to eq 200
      end
    end

    context 'トークンが古いがDBに格納されているので，トークンを再発行する場合' do
      it '認証が通る' do
        token = alice.user_tokens.create(token: alice.create_token(exp: Time.zone.now - 1.day, alg: alg))
        headers = {
          Authorization: "Bearer #{token.token}"
        }
        get '/auth_test', headers: headers
        expect(response.status).to eq 200
      end
    end

    context 'JWTが入ってない場合' do
      it '認証が通らない' do
        headers = {}
        get '/auth_test', headers: headers
        expect(response.status).to eq 401
      end
    end

    context 'トークンが不正な場合' do
      it '認証が通らない' do
        token = alice.user_tokens.create(token: alice.create_token(exp: Time.zone.now + 1.day, alg: 'none'))
        headers = {
          Authorization: "Bearer #{token.token}"
        }
        get '/auth_test', headers: headers
        expect(response.status).to eq 401
      end
    end

    context 'トークンが正常だが古い場合' do
      it '認証が通らない' do
        token = alice.user_tokens.new(token: alice.create_token(exp: Time.zone.now - 1.day, alg: alg))
        headers = {
          Authorization: "Bearer #{token.token}"
        }
        get '/auth_test', headers: headers
        expect(response.status).to eq 401
      end
    end
  end

end
