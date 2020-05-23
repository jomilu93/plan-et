class Part < ApplicationRecord
  belongs_to :city
  belongs_to :trip

  has_many :activities
end
