class Pais < ApplicationRecord
  has_many :cities

  include PgSearch::Model

  pg_search_scope :search_for_countries, :against => [:name, :region, :subregion],
    using: [
      :trigram
    ]

  validates :name, presence: true

end
