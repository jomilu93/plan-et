class Part < ApplicationRecord
  belongs_to :city
  belongs_to :trip
  has_many :activities #, dependent: :destroy
  # geocoded_by :city_id
  # after_validation :geocode

  include PgSearch::Model

  pg_search_scope :search_for_parts,
    against: [ :name ],

    associated_against: {
      city: [ :name ],
      trip: [ :name, :description],
    },

    using: {
      tsearch: { prefix: true }
    }

  #figure out how to ask user if they want to delete activities or not with part deletion.

  validates :name, :start_date, :end_date, presence: true

  def part_dates_array
    part_days = (self.end_date - self.start_date).to_i
    part_dates = [self.start_date]
    return part_dates if part_days == 0

    until part_dates.length == part_days
      part_dates << self.start_date += 1
    end
    part_dates
  end
end
