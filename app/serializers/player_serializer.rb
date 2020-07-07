class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :username
  has_many :characters
end
