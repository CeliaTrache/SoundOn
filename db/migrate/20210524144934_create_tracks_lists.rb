class CreateTracksLists < ActiveRecord::Migration[6.0]
  def change
    create_table :tracks_lists do |t|
      t.references :game, null: false, foreign_key: true
      t.references :track, null: false, foreign_key: true
      t.boolean :played_track

      t.timestamps
    end
  end
end
