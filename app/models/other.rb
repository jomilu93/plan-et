class Other < ApplicationRecord
  belongs_to :city

  has_one :activity, as: :activityable

  validates :name, :address, presence: true

end
