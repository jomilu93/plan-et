class Restaurant < ApplicationRecord
  belongs_to :activity, as: :activityable
end
