class Battle < ApplicationRecord
  belongs_to :user
  has_many :battle_my_poke_histories, dependent: :destroy
  has_many :my_poke_histories, through: :battle_my_poke_histories
  has_many :battle_opp_pokes, dependent: :destroy
  has_many :opp_pokes, through: :battle_opp_pokes

  validates :win, presence: true
end
