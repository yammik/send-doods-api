class GamesChannel < ApplicationCable::Channel
  def subscribed
    puts "sub to GChannel"
    stream_from "games_channel"
  end

  def unsubscribed
  end
end
