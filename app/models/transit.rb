class Transit < ApplicationRecord
  has_many :activities, :as => :activityable

  validates :transportation_type, :origin, :destination, presence: true
end
