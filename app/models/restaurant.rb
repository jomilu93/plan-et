class Restaurant < ApplicationRecord
  belongs_to :activity, as: :activityable

  validates :name, :address, :rating, :cuisine, :price, :phone_number, presence: true

end
