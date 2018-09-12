# User
class User < ApplicationRecord
  has_many(:user_tokens, dependent: :destroy)
  has_many(:my_pokes, dependent: :destroy)

  def create_token(exp: Time.zone.now + 1.day, alg: 'HS256')
    JWT.encode(
      { id: id, iat: Time.zone.now.to_i, exp: exp.to_i },
      Rails.application.credentials.secret_key_base,
      alg,
    )
  end
end
