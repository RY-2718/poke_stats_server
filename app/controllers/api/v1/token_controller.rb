# トークン作成用controller
class Api::V1::TokenController < ApplicationController
  def create
    google_uid = request.env['omniauth.auth']['uid']

    user = User.find_or_initialize_by(google_uid: google_uid)
    if user.new_record?
      render json: { errors: ['新規ユーザの作成に失敗しました'] }, status: :unauthorized unless user.save
    end

    user_token = user.user_tokens.new(token: user.create_token)
    if user_token.save
      # TODO: どのような形でユーザに返すかは要検討かも
      render json: { token: user_token.token }
    else
      render json: { errors: ['トークンの作成に失敗しました'] }, status: :unauthorized
    end
  end
end
