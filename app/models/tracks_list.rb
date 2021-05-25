class TracksList < ApplicationRecord
  belongs_to :game
  belongs_to :track
  validates :played_track, presence: true

end
