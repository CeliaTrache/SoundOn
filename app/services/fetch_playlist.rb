class FetchPlaylist
  def get_playlist(keyword)
    RSpotify::Playlist.search(keyword)
  end

  def get_playlists(user)
    RSpotify::User.find(user.spotify_token).playlists
  end

  def fetch_playlist(user, playlist_id)
    RSpotify::Playlist.find(user.spotify_token, playlist_id)
  end
end
