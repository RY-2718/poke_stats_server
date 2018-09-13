# MyPokeHistory 努力値とかの可変な値を扱う
class MyPokeHistory < ApplicationRecord
  belongs_to :my_poke
  has_many :my_poke_history_moves, dependent: :destroy

  validates :ability, presence: true
  validates :nature, presence: true
  validate :effort_value_should_be_valid, :individual_value_should_be_valid, :ability_should_be_valid, :moves_should_exist

  def full_info
    {
      item: item,
      nature: nature,
      effort: effort,
      individual: individual,
      moves: moves,
    }
  end

  def effort
    {
      h: effort_h,
      a: effort_a,
      b: effort_b,
      c: effort_c,
      d: effort_d,
      s: effort_s,
    }
  end

  def individual
    {
      h: individual_h,
      a: individual_a,
      b: individual_b,
      c: individual_c,
      d: individual_d,
      s: individual_s,
    }
  end

  def moves
    my_poke_history_moves.map(&:name)
  end

  private

    def effort_value_should_be_valid
      if effort.values.any? { |v| v < 0 || v > 255 } && effort.values.inject(:+) > 510
        errors.add(:effort_value, 'が不正です')
      end
    end

    def individual_value_should_be_valid
      if individual.values.any? { |v| v < 0 || v > 31 }
        errors.add(:individual_value, 'が不正です')
      end
    end

    def ability_should_be_valid
      unless my_poke.poke_dex.abilities.include?(ability)
        errors.add(:ability, 'が不正です')
      end
    end

    def moves_should_exist
      if !new_record? && moves == []
        errors.add(:moves, 'を覚えていません')
      elsif moves.size > 4
        errors.add(:moves, 'が多すぎます')
      end
    end
end
