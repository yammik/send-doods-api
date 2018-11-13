class MessagesController < ApplicationController
skip_before_action :verify_authenticity_token

  def index
    messages = Message.all
    render json: messages
  end

  def show
    message = Message.find_by(id: params[:id])
    render json: message
  end

  def create
    message = Message.new(message_params)
    game = Game.find(message_params[:game_id])

    puts "THIS IS MSG IN CREATE"
    puts message
    if message.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        MessageSerializer.new(message)
      ).serializable_hash
      MessagesChannel.broadcast_to game, serialized_data
      puts serialized_data
      head :ok
    end
  end

  private

  def message_params
    params.require(:message).permit(:text, :game_id)

  end
end
