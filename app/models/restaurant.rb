class Restaurant < ApplicationRecord
  belongs_to :city

  has_many :meals

  has_one_attached :photo
end
