class Attraction < ApplicationRecord
  belongs_to :activity, as: :activityable
end
