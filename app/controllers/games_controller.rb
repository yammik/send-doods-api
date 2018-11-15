class GamesController < ApplicationController
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
    game = Game.new(game_params)
    if game.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        GameSerializer.new(game)
      ).serializable_hash
      ActionCable.server.broadcast 'games_channel', serialized_data
      head :ok
    end
  end

  def update
    game = Game.find_by(id: params[:id])
    game.update(game_params)
    if game.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        GameSerializer.new(game)
      ).serializable_hash
      puts 'adsfsadf'
      GamesChannel.broadcast_to game, serialized_data
      head :ok
    end
  end

  private

  def game_params
    params.require(:game).permit(:title, :answer, :current, :active)
  end

end
