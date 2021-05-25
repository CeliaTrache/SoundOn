class Player < ApplicationRecord
  belongs_to :game
  validates :nickname, :score, presence: true
end
