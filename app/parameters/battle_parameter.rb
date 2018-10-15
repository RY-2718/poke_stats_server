require 'json'

# battleのパラメータをよしなにする
class BattleParameter
  def initialize(json: {}, battle: nil, user:)
    @json = JSON.parse(json, symbolize_names: true)
    @battle = battle
    @user = user
  end

  def battle
    {
      win: @json[:win].to_s,
      my_rate: @json[:my_rate],
      opp_rate: @json[:opp_rate],
      opp_name: @json[:opp_name],
    }.delete_if { |_, v| v.blank? }
  end

  def battle_my_poke_history
    battle_my_poke_history_in_battle + battle_my_poke_history_not_in_battle
  end

  def battle_opp_poke
    in_battle =
      if @json.key?(:opp_pokes_in_battle)
        @json[:opp_pokes_in_battle].map.with_index { |v, i| { opp_poke_id: v, order: i + 1 } }
      else
        @battle.opp_pokes_in_battle.map.with_index { |v, i| { opp_poke_id: v.id, order: i + 1 } }
      end
    not_in_battle =
      if @json.key?(:opp_pokes_not_in_battle)
        @json[:opp_pokes_not_in_battle].map { |v| { opp_poke_id: v, order: 0 } }
      else
        @battle.opp_pokes_not_in_battle.map { |v| { opp_poke_id: v.id, order: 0 } }
      end
    in_battle + not_in_battle
  end

  private

    def battle_my_poke_history_in_battle
      if @json.key?(:my_pokes_in_battle)
        @json[:my_pokes_in_battle].map.with_index do |v, i|
          history = @user.my_pokes.find_by(id: v).history
          { my_poke_history_id: history.id, order: i + 1 }
        end
      else
        @battle.my_pokes_in_battle.map.with_index { |v, i| { my_poke_history_id: v.history.id, order: i + 1 } }
      end
    end

    def battle_my_poke_history_not_in_battle
      if @json.key?(:my_pokes_not_in_battle)
        @json[:my_pokes_not_in_battle].map do |v|
          history = @user.my_pokes.find_by(id: v).history
          { my_poke_history_id: history.id, order: 0 }
        end
      else
        @battle.my_pokes_not_in_battle.map { |v| { my_poke_history_id: v.history.id, order: 0 } }
      end
    end
end
