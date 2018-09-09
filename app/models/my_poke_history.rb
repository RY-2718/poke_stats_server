class MyPokeHistory < ApplicationRecord
  belongs_to :my_poke
  has_many(:my_poke_history_moves, dependent: :destroy)

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
end
