class Game < ApplicationRecord
  belongs_to :user
  validates :duration, :playlist_title, presence: true
end
