class Transportation < ApplicationRecord
  belongs_to :city
  #belongs_to :city

  has_one :activity, as: :activityable
end
