class Hotel < ApplicationRecord
  belongs_to :city

  has_many :meals

  has_one_attached :photo

  validates :name, :address, :phone_number, :rating, :photo, presence: true

end
