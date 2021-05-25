class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.user = current_user
    if @game.save
      redirect_to edit_game_path(@game)
    else
      render :new
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  def edit
    @number_of_players = params[:number_of_players].to_i if params[:number_of_players].present?
    @game = Game.find(params[:id])
    @game.players.build
  end

  def update
    @game = Game.update(game_params)
    redirect_to game_path(@game)
  end

  private

  def game_params
    params.require(:game).permit(:duration, players_attributes: [:id, :nickname])
  end
end
