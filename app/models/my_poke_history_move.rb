# MyPokeHistoryMove MyPokeHistoryにmove[0-3]みたいなカラム持つよりマシでしょ
class MyPokeHistoryMove < ApplicationRecord
  belongs_to :my_poke_history
  validate :move_id_should_exists

  delegate :name, :type, :cat, :power, :accuracy, :pp, to: :move

  private

    def move
      @move ||= Move.find_by(id: move_id)
    end

    def move_id_should_exists
      unless Move.find_by(id: move_id)
        errors.add(:moves, 'が存在しません')
      end
    end
end
