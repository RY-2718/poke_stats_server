# UserをJSONで出力するときの整形をしてくれるスゴいやつ
class UserSerializer < ActiveModel::Serializer
  attributes :username
end
