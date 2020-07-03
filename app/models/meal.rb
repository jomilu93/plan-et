class Meal < ApplicationRecord
  belongs_to :city
  belongs_to :restaurant, optional: true

  has_one :activity, as: :activityable

  geocoded_by :address
  after_validation :geocode

  validates :name, :address, presence: true

end
