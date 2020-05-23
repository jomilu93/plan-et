class Transportation < ApplicationRecord
  belongs_to :origin_city, class_name:"city"
  belongs_to :destination_city, class_name: "city"

  has_one :activity, as: :activityable

  validates :type, presence: true

end
