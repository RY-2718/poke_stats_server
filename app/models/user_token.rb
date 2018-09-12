# User Token まあこれは触らんやろ……多分
class UserToken < ApplicationRecord
  belongs_to(:user)
end
