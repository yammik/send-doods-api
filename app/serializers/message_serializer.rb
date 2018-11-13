class MessageSerializer < ActiveModel::Serializer
  attributes :id, :text, :game_id, :created_at
end
