class MessageSerializer < ActiveModel::Serializer
  attributes :id, :text, :game_id, :user_name
end
