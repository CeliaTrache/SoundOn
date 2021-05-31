class PlaylistsController < ApplicationController

  def index
    @game = Game.find(params[:game_id])
    if params[:query].present?
      search = FetchPlaylist.new
      dynamic_search = search.get_playlist(params[:query])
      dynamic_search.each do |playlist|
        title = playlist.name
        description = playlist.description
        image = playlist.images[0]["url"]
        number_of_songs = playlist.total
        spotify_id = playlist.id
        if Playlist.find_by(spotify_id: spotify_id).nil?
          Playlist.create(title: title, songs_number: number_of_songs, description: description, image_url: image, spotify_id: spotify_id)
        end
      end
      @playlists = policy_scope(Playlist).search_playlist(params[:query])
    else
      @playlists = policy_scope(Playlist).all
    end
  end
end
