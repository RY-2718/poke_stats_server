class MyPoke < ApplicationRecord
  belongs_to :user
  has_many(:my_poke_histories, dependent: :destroy)
end
