# OppPoke 敵ポケモンさんの情報を扱うmodelだよ〜
class OppPoke < ApplicationRecord
  belongs_to :user
  has_many :opp_poke_moves, dependent: :destroy

  validates :poke_dex_id, presence: true

  delegate :name, :base, :types, to: :poke_dex

  def full_info
    {
      id: id,
      name: name,
      base: base,
      types: types,
      ability: ability,
      item: item,
      nature: nature,
      memo: memo,
      moves: moves,
    }
  end

  def moves
    opp_poke_moves.map(&:name)
  end

  def poke_dex
    @poke_dex ||= PokeDex.find_by(id: poke_dex_id)
  end
end
