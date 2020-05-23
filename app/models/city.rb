class City < ApplicationRecord
  belongs_to :pais

  has_many :parts
  has_many :users
  has_many :hotels
  has_many :meals
  has_many :accomodations
  has_many :transportations
  has_many :others
  has_many :attractions
  has_many :restaurants
end
