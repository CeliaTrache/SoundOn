class PlaylistsController < ApplicationController

  def index
    if params[:query].present?
      @playlists = policy_scope(Playlist).search_playlist(params[:query])
    else
      @playlists = policy_scope(Playlist).all
    end
    @game = Game.find(params[:game_id])
  end
end
