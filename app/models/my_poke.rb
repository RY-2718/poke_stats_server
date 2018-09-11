class MyPoke < ApplicationRecord
  belongs_to :user
  has_many(:my_poke_histories, dependent: :destroy)
  validates :poke_dex_id, presence: true

  def full_info(history = latest_history)
    {
      id: id,
      name: poke_dex.name,
      base: poke_dex.base,
      types: poke_dex.types,
    }.merge(history.full_info)
  end

  def poke_dex
    @poke_dex ||= PokeDex.find_by(id: poke_dex_id)
  end

  private

    def latest_history
      @latest_history ||= MyPokeHistory.find_by(my_poke_id: id)
    end
end
