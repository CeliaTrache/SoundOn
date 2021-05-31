class PlaylistsController < ApplicationController
  def index
    if params[:query].present?
      @playlists = policy_scope(Playlist).search_playlist(params[:query])
    else
      @playlists = policy_scope(Playlist).all
    end
    @game = Game.find(params[:game_id])
  end

  def create_tracks
    playlist = Playlist.find(params[:id])
    tracks = RSpotify::Playlist.find_by_id(playlist.spotify_id, market: nil).tracks
    tracks.each do |track|
      title = track.name
      artists = []
      track.artists.each do |artist|
        artists << artist.name
      end
      duration = track.duration_ms
      uri = track.uri
      id = track.id
      new_track = Track.create(title: title, artist: artists, duration: duration, spotify_id: id, spotify_url: uri)
      TracksList.create(track: new_track, game: Game.find(params[:game_id]), played_track: false)
    end
    raise
    # redirect_to game_path(Game.find(params[:game_id])
  end
end

