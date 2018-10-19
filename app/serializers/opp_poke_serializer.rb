# MyPokeをJSONで出力するときの整形をしてくれるスゴいやつ
class OppPokeSerializer < ActiveModel::Serializer
  attributes :id, :name, :base, :types, :ability, :item, :nature, :memo, :moves
end
