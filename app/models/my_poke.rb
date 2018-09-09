class MyPoke < ApplicationRecord
  belongs_to :user
  has_many(:my_poke_histories, dependent: :destroy)

  def full_info
    {
      id: id,
      name: poke_dex.name,
      item: latest_history.item,
      nature: latest_history.nature,
      base: poke_dex.base,
      effort: latest_history.effort,
      individual: latest_history.individual,
      moves: latest_history.moves,
      types: poke_dex.types,
    }
  end

  private

    def poke_dex
      @poke_dex ||= PokeDex.find_by(id: poke_dex_id)
    end

    def latest_history
      @latest_history ||= MyPokeHistory.find_by(my_poke_id: id)
    end
end
