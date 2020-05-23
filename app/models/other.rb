class Other < ApplicationRecord
  belongs_to :city

  has_one :activity, as: :activityable
end
