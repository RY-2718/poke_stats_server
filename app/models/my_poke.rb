# MyPoke 変更のない情報だけ扱う，多分
class MyPoke < ApplicationRecord
  belongs_to :user
  has_many :my_poke_histories, dependent: :destroy
  validates :poke_dex_id, presence: true
  delegate :name, :base, :types, to: :poke_dex

  attr_writer :history

  def history
    @history ||= latest_history
  end

  def full_info
    {
      id: id,
      name: name,
      base: base,
      types: types,
      real: real,
    }.merge(history.full_info)
  end

  def poke_dex
    @poke_dex ||= PokeDex.find_by(id: poke_dex_id)
  end

  def real # rubocop:disable Metrics/AbcSize
    effort = history.effort
    individual = history.individual
    nature = Nature.find_by(name: history.nature)

    {
      h: (base[:h] + individual[:h] / 2.0 + effort[:h] / 8.0).to_i + 60,
      a: ((base[:a] + individual[:a] / 2.0 + effort[:a] / 8.0 + 5).to_i * nature[:a]).to_i,
      b: ((base[:b] + individual[:b] / 2.0 + effort[:b] / 8.0 + 5).to_i * nature[:b]).to_i,
      c: ((base[:c] + individual[:c] / 2.0 + effort[:c] / 8.0 + 5).to_i * nature[:c]).to_i,
      d: ((base[:d] + individual[:d] / 2.0 + effort[:d] / 8.0 + 5).to_i * nature[:d]).to_i,
      s: ((base[:s] + individual[:s] / 2.0 + effort[:s] / 8.0 + 5).to_i * nature[:s]).to_i,
    }
  end

  def dup_or_get_history
    if needs_create_new_history
      latest_history.dup
    else
      latest_history
    end
  end

  def needs_create_new_history
    updated_at > latest_history.created_at
  end

  private

    def latest_history
      @latest_history ||= my_poke_histories.order(created_at: :desc).first
    end
end
