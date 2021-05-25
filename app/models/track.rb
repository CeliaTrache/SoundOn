class Track < ApplicationRecord
  validates :title, :artist, :duration, :spotify_id, :spotify_url, presence: true
end
