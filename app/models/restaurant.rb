class Restaurant < ApplicationRecord
  belongs_to :city

  has_many :meals

  has_one_attached :photo

  validates :name, :address, :phone_number, :rating, :avg_price, :business_hours, :cuisine,  presence: true

end
