class Trip < ApplicationRecord
  belongs_to :user

  has_many :parts

  has_many_attached :photos

  validates :name, :start_date, :end_date, presence: true

end
