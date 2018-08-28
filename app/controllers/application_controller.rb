class ApplicationController < ActionController::API
  ALG = 'HS256'.freeze

  def current_user
    @current_user ||= User.find_by(id: @jwt_user_id)
  end

  def jwt_authenticate
    unless jwt_bearer_token
      response.header['WWW-Authenticate'] = 'Bearer realm="Poke Stats"'
      render json: { errors: [{ message: 'Unauthorized' }] }, status: :unauthorized
      return
    end

    if jwt_decoded_token.nil?
      response.header['WWW-Authenticate'] = 'Bearer realm="Poke Stats", error="invalid_token"'
      render json: { errors: [{ message: 'Invalid token' }] }, status: :unauthorized
      return
    end

    # 有効か検査
    jwt_user_id = jwt_decoded_token[0]['id']
    if UserToken.where(user_id: jwt_user_id, token: jwt_bearer_token).exists?
      @jwt_user_id = jwt_user_id
    else
      response.header['WWW-Authenticate'] = 'Bearer realm="Poke Stats", error="invalid_token"'
      render json: { errors: [{ message: 'Expired token' }] }, status: :unauthorized
    end
  end

  private

    def jwt_bearer_token
      @jwt_bearer_token ||=
        if request.headers['Authorization'].present?
          scheme, token = request.headers['Authorization'].split(' ')
          (scheme == 'Bearer' ? token : nil)
        end
    end

    def jwt_decoded_token
      # verify_iat を指定しても実際には何も起こらない
      # iat を含めない場合も、iat が未来の日付の場合も、エラーは発生しなかった
      @jwt_decoded_token ||=
        JWT.decode(
          jwt_bearer_token,
          Rails.application.credentials.secret_key_base,
          verify_iat: true, algorithm: ALG
        )
    rescue JWT::DecodeError, JWT::VerificationError, JWT::InvalidIatError
      # エラーの詳細をクライアントには伝えないため、常に nil を返す
      nil
    end
end
