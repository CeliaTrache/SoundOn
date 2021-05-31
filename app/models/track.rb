class Track < ApplicationRecord
  has_many :tracks_lists
  has_many :games, through: :tacks_lists
end
