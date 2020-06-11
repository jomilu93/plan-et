class Trip < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search_for_trips, :against => [:name, :description],
    using: {
      :tsearch => {:prefix => true}
    }

  belongs_to :user

  has_many :parts, dependent: :destroy

  has_many_attached :photos

  validates :name, :start_date, :end_date, presence: true

  # def city_names
  #   city_names = []
  #   Trip.parts each do |part|
  #     city_names << part.city.name
  #   end
  #   city_names
  # end



end
