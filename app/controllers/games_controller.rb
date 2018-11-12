class GamesController < ApplicationController
  # skip_before_filter :verify_authenticity_token
skip_before_action :verify_authenticity_token
  def index
    games = Game.all
    render json: games
  end

  def show
    game = Game.find_by(id: params[:id])
    render json: game
  end

  def create
    puts "THIS IS GAME IN CREATE"
    game = Game.new(game_params)
    puts game
    if game.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        GameSerializer.new(game)
      ).serializable_hash
      ActionCable.server.broadcast 'games_channel', serialized_data
      puts "THIS IS SERIALIZED DATA"
      puts serialized_data
      head :ok
    end
  end

  private

  def game_params
    puts 'THIS IS GAME PARAMS'
    puts params.require(:game)
    params.require(:game).permit(:title)
  end

end
