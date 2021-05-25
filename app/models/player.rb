class Player < ApplicationRecord
  belongs_to :game
  validates :nickname, presence: true, uniqueness: true
end
