class Attraction < ApplicationRecord
  has_many :activities, :as => :activityable

  validates :name, :address, :rating, :price, :phone_number, presence: true

end
