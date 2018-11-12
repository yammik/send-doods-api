class DrawingSerializer < ActiveModel::Serializer
  attributes :id, :line, :userId, :game_id, :color
end
