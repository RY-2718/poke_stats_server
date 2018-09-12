require 'json'

class MyPokeParameter

  def initialize(json: {}, my_poke: nil)
    @json = JSON.parse(json, symbolize_names: true)
    @my_poke = my_poke
  end

  def valid_for_create?
    @json.key?(:poke_name) &&
      @json.key?(:ability) &&
      @json.key?(:item) &&
      @json.key?(:nature) &&
      @json.key?(:effort) &&
      @json.key?(:individual) &&
      @json.key?(:moves)
  end

  def my_poke
    {
      poke_dex_id: PokeDex.find_by(name: @json[:poke_name]).id,
    }
  end

  def my_poke_history
    result = {
      ability: @json[:ability],
      item: @json[:item],
      nature: @json[:nature],
    }
    result.merge!(effort_hash) if @json.key?(:effort)
    result.merge!(individual_hash) if @json.key?(:individual)
    result.delete_if { |_, v| v.blank? }
  end

  def my_poke_history_moves
    if @my_poke.nil? || @json.key?(:moves)
      @json[:moves].map { |v| { move_id: Move.find_by(name: v).id } }
    else
      @my_poke.latest_history.moves.map { |v| { move_id: Move.find_by(name: v).id } }
    end
  end

  private

    def effort_hash
      {
        effort_h: @json[:effort][:h].to_i,
        effort_a: @json[:effort][:a].to_i,
        effort_b: @json[:effort][:b].to_i,
        effort_c: @json[:effort][:c].to_i,
        effort_d: @json[:effort][:d].to_i,
        effort_s: @json[:effort][:s].to_i,
      }
    end

    def individual_hash
      {
        individual_h: @json[:individual][:h].to_i,
        individual_a: @json[:individual][:a].to_i,
        individual_b: @json[:individual][:b].to_i,
        individual_c: @json[:individual][:c].to_i,
        individual_d: @json[:individual][:d].to_i,
        individual_s: @json[:individual][:s].to_i,
      }
    end
end
