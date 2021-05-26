class GamesController < ApplicationController
  def new
    @game = Game.new
    authorize @game
  end

  def create
    @game = Game.new(game_params)
    @game.user = current_user
    authorize @game
    if @game.save
      redirect_to edit_game_path(@game)
    else
      render :new
    end
  end

  def show
    @game = Game.find(params[:id])
    @user = current_user
    authorize @game
  end

  def edit
    @number_of_players = params[:number_of_players].to_i if params[:number_of_players].present?
    @game = Game.find(params[:id])
    authorize @game
    @game.players.build
  end

  def update
    @game = Game.find(params[:id])
    authorize @game
    if player_params
      player_params[:players_attributes].each_key do |id|
        Player.create(game: @game, nickname: player_params[:players_attributes].values[id.to_i][:nickname])
      end
      redirect_to game_path(@game)
    else
      render :edit
    end
  end

  def solution
    @game = Game.find(params[:id])
    authorize @game
  end

  private

  def game_params
    params.require(:game).permit(:duration)
  end

  def player_params
    params.require(:game).permit(players_attributes: [:id, :nickname])
  end
end
