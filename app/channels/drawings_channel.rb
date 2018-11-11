class DrawingsChannel < ApplicationCable::Channel
  def subscribed
    puts "subscribed to DrawingsChannel"
    puts params[:game]
    game = Game.find(params[:game])
    stream_for game
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
