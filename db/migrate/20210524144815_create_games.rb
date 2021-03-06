class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.integer :duration
      t.references :user, null: false, foreign_key: true
      t.string :playlist_title

      t.timestamps
    end
  end
end
