# トークン作成用controller
class Api::V1::TokenController < ApplicationController
  before_action :jwt_authenticate, only: :hello
  def create
    google_uid = request.env['omniauth.auth']['uid']

    user = User.find_or_initialize_by(google_uid: google_uid)
    if user.new_record?
      unless user.save
        render json: { errors: ['新規ユーザの作成に失敗しました'] }, status: :unauthorized
        return
      end
    end

    user_token = user.user_tokens.new(token: user.create_token(exp: Time.zone.now + 1.day, alg: ALG))
    if user_token.save
      response.headers['Authorization'] = "Bearer #{user_token.token}"
      render json: { token: user_token.token }
    else
      render json: { errors: ['トークンの作成に失敗しました'] }, status: :unauthorized
    end
  end

  def hello
    render json: { txt: 'hello!' }
  end
end
