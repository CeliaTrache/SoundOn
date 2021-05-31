class Playlist < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_playlist,
    against: [ :title, :description, :category ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
  paginates_per 8
end
