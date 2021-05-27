class Playlist < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_title_and_description_and_category,
    against: [ :title, :description, :category ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
