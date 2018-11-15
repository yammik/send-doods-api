class GameSerializer < ActiveModel::Serializer
  attributes :id, :title, :answer, :current, :active, :answermode
  has_many :drawings
end
