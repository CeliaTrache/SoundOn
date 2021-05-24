class CreatePlaylists < ActiveRecord::Migration[6.0]
  def change
    create_table :playlists do |t|
      t.string :title
      t.integer :songs_number
      t.integer :spotify_id
      t.string :category

      t.timestamps
    end
  end
end
