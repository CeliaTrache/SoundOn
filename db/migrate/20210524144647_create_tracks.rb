class CreateTracks < ActiveRecord::Migration[6.0]
  def change
    create_table :tracks do |t|
      t.string :title
      t.string :artist
      t.integer :duration
      t.integer :spotify_id
      t.string :spotify_url

      t.timestamps
    end
  end
end
