class Attraction < ApplicationRecord
  belongs_to :city

  has_one :activity, as: :activityable

  has_one_attached :photo

  validates :name, :address, :attraction_type, presence: true

end
