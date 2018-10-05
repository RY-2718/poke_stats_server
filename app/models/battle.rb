# 対戦を記録するクラス
class Battle < ApplicationRecord
  belongs_to :user
  has_many :battle_my_poke_histories, dependent: :destroy
  has_many :my_poke_histories, through: :battle_my_poke_histories
  has_many :battle_opp_pokes, dependent: :destroy
  has_many :opp_pokes, through: :battle_opp_pokes

  validates :win, presence: true

  def my_pokes_in_battle
    history_ids = battle_my_poke_histories.order(:order).reject { |v| v.order == 0 }.map(&:my_poke_history_id)
    history_ids.map do |id|
      history = my_poke_histories.find_by(id: id)
      history.my_poke.tap { |my_poke| my_poke.history = history }
    end
  end

  def my_pokes_not_in_battle
    history_ids = battle_my_poke_histories.select { |v| v.order == 0 }.map(&:my_poke_history_id)
    history_ids.map do |id|
      history = my_poke_histories.find_by(id: id)
      history.my_poke.tap { |my_poke| my_poke.history = history }
    end
  end
end
