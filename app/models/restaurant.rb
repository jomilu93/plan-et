class Restaurant < ApplicationRecord
  has_many :activities, :as => :activityable

  validates :name, :address, :rating, :cuisine, :price, :phone_number, presence: true

end
