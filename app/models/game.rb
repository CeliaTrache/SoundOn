class Game < ApplicationRecord
  belongs_to :user
  has_many :players
  validates_associated :players
  accepts_nested_attributes_for :players
  has_many :tacks_lists
end
