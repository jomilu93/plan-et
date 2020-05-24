class Part < ApplicationRecord
  belongs_to :city
  belongs_to :trip

  has_many :activities

  validates :name, :start_date, :end_date, presence: true

end
