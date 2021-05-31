class AddSpotifyIdToPlaylist < ActiveRecord::Migration[6.0]
  def change
    change_column :playlists, :spotify_id, :string
  end
end
