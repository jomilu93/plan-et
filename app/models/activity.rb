class Activity < ApplicationRecord
  belongs_to :activityable, polymorphic: true
  belongs_to :itinerary
end
