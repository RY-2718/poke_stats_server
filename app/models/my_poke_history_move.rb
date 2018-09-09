class MyPokeHistoryMove < ApplicationRecord
  belongs_to :my_poke_history

  def name
    move.name
  end

  def type
    move.type
  end

  def cat
    move.cat
  end

  def power
    move.power
  end

  def accuracy
    move.accuracy
  end

  def pp
    move.pp
  end

  private

    def move
      @move ||= Move.find_by(id: move_id)
    end
end
