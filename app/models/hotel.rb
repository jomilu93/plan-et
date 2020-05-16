class Hotel < ApplicationRecord
  belongs_to :activity, as: :activityable

  validates :name, :address, :rating, :price, :phone_number, presence: true

end
