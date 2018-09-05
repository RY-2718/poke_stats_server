class MyPokeHistory < ApplicationRecord
  belongs_to :my_poke
  has_many(:my_poke_history_moves, dependent: :destroy)
end
