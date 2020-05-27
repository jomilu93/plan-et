class Transportation < ApplicationRecord
  has_one :origin_city, class_name:"city"
  has_one :destination_city, class_name: "city"

  has_one :activity, as: :activityable

  validates :transportation_type, presence: true

end
