class FetchPlaylist
  def get_playlist(keyword)
    playlists = RSpotify::Playlist.search(keyword)
  end

  # Save all tracks from the choosen playlist

  # The user click on a playlist
  # get the playlist name => JS
  # get the game_id => in the params ?

  # Call Spotify API to download all tracks in this playlist and save in tracks table
    # we need to record : title, artist, duration, spotify_id, spotify_url
  # Link all tracks to the game thanks to tracks_lists table
    # tracks are played_track: false

  def get_tracks(playlist) # object spotify
    tracks = playlist.tracks
  end
end

# Play tracks
# in games#show
