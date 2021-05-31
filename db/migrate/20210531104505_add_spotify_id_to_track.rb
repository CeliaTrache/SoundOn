class AddSpotifyIdToTrack < ActiveRecord::Migration[6.0]
  def change
    change_column :tracks, :spotify_id, :string
  end
end
