# トークン作成用controller
class Api::V1::TokenController < ApplicationController
  def create
    google_uid = request.env['omniauth.auth']['uid']

    render json: "{uid: #{google_uid}}"
  end
end
