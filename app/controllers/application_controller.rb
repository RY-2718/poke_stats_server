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

    @jwt_user_id = jwt_decoded_token[0]['id']
    response.headers['Authorization'] = "Bearer #{jwt_bearer_token}"
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
      @jwt_decoded_token ||=
        JWT.decode(
          jwt_bearer_token,
          Rails.application.credentials.secret_key_base,
          verify_iat: true,
          algorithm: ALG
        )
    rescue JWT::ExpiredSignature
      if (old_token = UserToken.find_by(token: jwt_bearer_token))
        user = old_token.user
        new_token = user.user_tokens.new(token: user.create_token(ALG))
        @jwt_bearer_token = new_token.token if new_token.save
      end
    rescue JWT::DecodeError, JWT::VerificationError, JWT::InvalidIatError
      # エラーの詳細をクライアントには伝えないため、常に nil を返す
      nil
    end
end
