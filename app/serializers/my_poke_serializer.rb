# MyPokeをJSONで出力するときの整形をしてくれるスゴいやつ
class MyPokeSerializer < ActiveModel::Serializer
  # TODO: いい感じに作っていく
  attributes :id, :name, :base, :types, :real

  attribute :ability
  attribute :item
  attribute :nature
  attribute :effort
  attribute :individual
  attribute :moves
  attribute :memo

  # TODO: delegates使えばいい感じにリファクタできそうな気がする
  def ability
    object.history.ability
  end

  def item
    object.history.item
  end

  def nature
    object.history.nature
  end

  def effort
    object.history.effort
  end

  def individual
    object.history.individual
  end

  def moves
    object.history.moves
  end

  def memo
    object.history.memo
  end
end
