class Other < ApplicationRecord
  belongs_to :city

  has_one :activity, as: :activityable

  geocoded_by :address
  after_validation :geocode

  validates :name, :address, presence: true

end
