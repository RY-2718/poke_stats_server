# 中間テーブル
class BattleMyPokeHistory < ApplicationRecord
  belongs_to :battle
  belongs_to :my_poke_history
end
