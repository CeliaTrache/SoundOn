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
    @questions = ['artist', 'title']
    @game = Game.find(params[:id])
    authorize @game
    @user = current_user
    # @track = Track.where(title: "Lovely Day")
    tracks_list = TracksList.where(game: @game, played_track: false).first
    if tracks_list
      tracks_list.played_track = true
      tracks_list.save
      @track = tracks_list.track
      if @track.nil?
        redirect_to results_game_path(@game)
      end
    end
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
      redirect_to playlists_path(game_id: @game.id)
    else
      render :edit
    end
  end

  def solution
    @game = Game.find(params[:id])
    authorize @game
    @track = Track.find(params[:track_id])
  end

  def results
    @game = Game.find(params[:id])
    authorize @game
    @players = @game.players
    @players = @players.as_json.sort! { |a, b| a[:score] <=> b[:score] }.reverse
  end

  private

  def game_params
    params.require(:game).permit(:duration)
  end

  def player_params
    params.require(:game).permit(players_attributes: [:id, :nickname])
  end
end
