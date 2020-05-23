class Activity < ApplicationRecord
  belongs_to :part
  belongs_to :activityable, polymorphic: true
end
