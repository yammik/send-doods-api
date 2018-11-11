class DrawingsController < ApplicationController
skip_before_action :verify_authenticity_token

  def create
    drawing = Drawing.new(drawing_params)
    game = Game.find(drawing_params[:game_id])

    puts "THIS IS DRAWING IN CREATE"
    puts drawing
    if drawing.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        DrawingSerializer.new(drawing)
      ).serializable_hash
      DrawingsChannel.broadcast_to game, serialized_data
      puts serialized_data
      head :ok
    end
  end

  private

  def drawing_params
    params.require(:drawing).permit(:userId, :game_id, :line => [:start => [:offsetX, :offsetY], :stop => [:offsetX, :offsetY]])

  end
end
