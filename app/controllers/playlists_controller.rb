class PlaylistsController < ApplicationController

  def index
    @playlists = policy_scope(Playlist).all
  end
end
