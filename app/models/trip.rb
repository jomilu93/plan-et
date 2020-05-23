class Trip < ApplicationRecord
  belongs_to :user

  has_many :parts

  has_many_attached :photos
end
