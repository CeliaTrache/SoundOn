class PlayersController < ApplicationController
  def update
    @player = Player.find(params[:id])
    authorize @player
    @player.score.nil? ? @player.score = 10 : @player.score += 10
    respond_to do |format|
      if @player.update(score: @player.score)
        format.html { redirect_to solution_game_path(@player.game) }
        format.json { render json: { score: @player.score } }
      end
    end
  end
end
