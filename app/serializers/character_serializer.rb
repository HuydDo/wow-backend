class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :gender, :name, :race, :character_class, :player_id
end
