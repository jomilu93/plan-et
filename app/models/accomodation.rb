class Accomodation < ApplicationRecord
  belongs_to :city
  belongs_to :hotel, optional: true

  has_one :activity, as: :activityable

  validates :name, :address, presence: true

end
