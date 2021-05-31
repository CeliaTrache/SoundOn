class FetchPlaylist
  def get_playlist(keyword)
    playlists = RSpotify::Playlist.search(keyword)
  end
end
