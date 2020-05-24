class Meal < ApplicationRecord
  belongs_to :city
  belongs_to :restaurant

  has_one :activity, as: :activityable

  validates :name, :address, presence: true

end
