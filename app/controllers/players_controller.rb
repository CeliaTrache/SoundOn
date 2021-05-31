class PlayersController < ApplicationController
  def update
    @player = Player.find(params[:id])
    @player_score = params[:score].to_i
    authorize @player
    if @player.score.nil?
      @player.score = 0
    end
    @player.score += @player_score
    
    respond_to do |format|
      if @player.update(score: @player.score)
        format.html { redirect_to solution_game_path(@player.game) }
        format.json { render json: { score: @player.score } }
      end
    end
  end
end
