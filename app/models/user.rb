class User < ApplicationRecord
  has_many(:user_tokens, dependent: :destroy)

  def create_token(alg)
    JWT.encode({ id: id, iat: Time.zone.now.to_i }, Rails.application.credentials.secret_key_base, alg)
  end
end
