class DrawingsChannel < ApplicationCable::Channel
  def subscribed
    puts "subscribed to DrawingsChannel at game: " + params[:game]
    game = Game.find(params[:game])
    stream_for game
  end

  def unsubscribed
  end
end
