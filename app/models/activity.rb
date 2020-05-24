class Activity < ApplicationRecord
  belongs_to :part
  belongs_to :activityable, polymorphic: true

  validates :start_time, :end_time, presence: true

end
