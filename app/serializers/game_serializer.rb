class GameSerializer < ActiveModel::Serializer
  attributes :id, :title, :answer, :current, :active
  has_many :drawings
end
