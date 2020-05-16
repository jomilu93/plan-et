class Transit < ApplicationRecord
  belongs_to :activity, as: :activityable

  validates :transportation_type, :origin, :destination, presence: true

end
