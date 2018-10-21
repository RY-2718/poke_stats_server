require 'json'

# OppPokeControllerの#createとか#updateとかで使うパラメータをよしなにする
class OppPokeParameter
  def initialize(json: {}, opp_poke: nil)
    @json = JSON.parse(json, symbolize_names: true)
    @opp_poke = opp_poke
  end

  def valid?
    @json.key?(:poke_name) &&
      PokeDex.find_by(name: @json[:poke_name]).present? &&
      (!@json.key(:moves) || @json[:moves].all? { |v| Move.find_by(name: v).present? })
  end

  def opp_poke
    {
      poke_dex_id: @opp_poke&.poke_dex_id || PokeDex.find_by(name: @json[:poke_name]).id,
      ability: @json[:ability],
      item: @json[:item],
      memo: @json[:memo],
      nature: @json[:nature],
    }.delete_if { |_, v| v.blank? }
  end

  def opp_poke_moves
    if @opp_poke.nil? || @json.key?(:moves)
      @json[:moves].map { |v| { move_id: Move.find_by(name: v).id } }
    else
      @opp_poke.moves.map { |v| { move_id: Move.find_by(name: v).id } }
    end
  end
end
