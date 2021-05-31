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
      @playlists = policy_scope(Playlist).search_playlist(params[:query]).page params[:page]
    else
      @playlists = policy_scope(Playlist).page params[:page]
    end
  end

  def create_tracks
    @game = Game.find(params[:game_id])
    @playlist = Playlist.find(params[:id])
    authorize @playlist
    tracks_number = @game.duration * 60 / 15
    tracks = RSpotify::Playlist.find_by_id(@playlist.spotify_id, market: nil).tracks(limit: tracks_number)
    tracks.each do |track|
      title = track.name
      artists = []
      track.artists.each do |artist|
        artists << artist.name
      end
      duration = track.duration_ms
      uri = track.uri
      id = track.id
      new_track = Track.find_or_create_by(title: title, artist: artists, duration: duration, spotify_id: id, spotify_url: uri)
      TracksList.create(track: new_track, game: @game, played_track: false)
    end
    redirect_to game_path(@game)
  end
end

