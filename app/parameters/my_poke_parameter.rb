require 'json'

class MyPokeParameter

  def initialize(params = {})
    @json = JSON.parse(params, symbolize_names: true)
  end

  def my_poke
    {
      poke_dex_id: PokeDex.find_by(name: @json[:poke_name]).id,
    }
  end

  def my_poke_history
    {
      ability: @json[:ability],
      item: @json[:item],
      nature: @json[:nature],
      effort_h: @json[:effort][:h].to_i,
      effort_a: @json[:effort][:a].to_i,
      effort_b: @json[:effort][:b].to_i,
      effort_c: @json[:effort][:c].to_i,
      effort_d: @json[:effort][:d].to_i,
      effort_s: @json[:effort][:s].to_i,
      individual_h: @json[:individual][:h].to_i,
      individual_a: @json[:individual][:a].to_i,
      individual_b: @json[:individual][:b].to_i,
      individual_c: @json[:individual][:c].to_i,
      individual_d: @json[:individual][:d].to_i,
      individual_s: @json[:individual][:s].to_i,
    }
  end

  def my_poke_history_moves
    @json[:moves].map { |v| { move_id: Move.find_by(name: v).id } }
  end
end
