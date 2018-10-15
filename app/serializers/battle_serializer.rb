# battleをいい感じのJSONにしてくれるやつ
class BattleSerializer < ActiveModel::Serializer
  attributes :id, :win, :my_rate, :opp_rate, :opp_name
  has_many :my_pokes_in_battle, serializer: MyPokeSerializer
  has_many :my_pokes_not_in_battle, serializer: MyPokeSerializer
  has_many :opp_pokes_in_battle, serializer: OppPokeSerializer
  has_many :opp_pokes_not_in_battle, serializer: OppPokeSerializer
end
