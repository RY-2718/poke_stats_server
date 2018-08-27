class User < ApplicationRecord
  has_many(:user_tokens, dependent: :destroy)

  def create_token
    JWT.encode({ id: id, iat: Time.zone.now.to_i }, Rails.application.credentials.secret_key_base, 'HS256')
  end
end
