class Hotel < ApplicationRecord
  belongs_to :activity, as: :activityable
end
