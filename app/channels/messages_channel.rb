class MessagesChannel < ApplicationCable::Channel
  def subscribed
    puts "subscribed to MsgsChannel at game: " + params[:game]
    game = Game.find(params[:game])
    stream_for game
  end

  def unsubscribed
  end
end
