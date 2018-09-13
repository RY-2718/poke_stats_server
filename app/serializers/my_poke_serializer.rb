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

  def ability
    object.latest_history.ability
  end

  def item
    object.latest_history.item
  end

  def nature
    object.latest_history.nature
  end

  def effort
    object.latest_history.effort
  end

  def individual
    object.latest_history.individual
  end

  def moves
    object.latest_history.moves
  end

  def memo
    object.latest_history.memo
  end
end
