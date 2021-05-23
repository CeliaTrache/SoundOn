class AddImageToPlaylists < ActiveRecord::Migration[6.0]
  def change
    add_column :playlists, :image_url, :string
  end
end
