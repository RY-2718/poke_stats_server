# 対戦を記録するクラス
class Battle < ApplicationRecord
  belongs_to :user
  has_many :battle_my_poke_histories, dependent: :destroy
  has_many :my_poke_histories, through: :battle_my_poke_histories
  has_many :battle_opp_pokes, dependent: :destroy
  has_many :opp_pokes, through: :battle_opp_pokes

  validates :win, inclusion: { in: [true, false] }

  def my_pokes_in_battle
    battle_my_poke_histories.order(:order).reject { |v| v.order == 0 }.map do |v|
      history = my_poke_histories.find_by(id: v.my_poke_history_id)
      history.my_poke.tap { |my_poke| my_poke.history = history }
    end
  end

  def my_pokes_not_in_battle
    battle_my_poke_histories.select { |v| v.order == 0 }.map do |v|
      history = my_poke_histories.find_by(id: v.my_poke_history_id)
      history.my_poke.tap { |my_poke| my_poke.history = history }
    end
  end

  def opp_pokes_in_battle
    battle_opp_pokes.order(:order).reject { |v| v.order == 0 }.map do |v|
      opp_pokes.find_by(id: v.opp_poke_id)
    end
  end

  def opp_pokes_not_in_battle
    battle_opp_pokes.select { |v| v.order == 0 }.map do |v|
      opp_pokes.find_by(id: v.opp_poke_id)
    end
  end
end
