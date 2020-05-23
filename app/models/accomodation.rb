class Accomodation < ApplicationRecord
  belongs_to :city
  belongs_to :hotel

  has_one :activity, as: :activityable
end
