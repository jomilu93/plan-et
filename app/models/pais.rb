class Pais < ApplicationRecord
  has_many :cities

  include PgSearch::Model

  pg_search_scope :search_for_countries, :against => [:name, :region, :subregion],
    using: {
      :tsearch => {:prefix => true}
    }

  validates :name, presence: true

end
