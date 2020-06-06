class Meal < ApplicationRecord
  belongs_to :city
  belongs_to :restaurant, optional: true

  has_one :activity, as: :activityable

  validates :name, :address, presence: true

end
