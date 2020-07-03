class Accomodation < ApplicationRecord
  belongs_to :city
  belongs_to :hotel, optional: true

  has_one :activity, as: :activityable

  geocoded_by :address
  after_validation :geocode

  validates :name, :address, presence: true

end
