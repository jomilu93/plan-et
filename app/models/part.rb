class Part < ApplicationRecord
  belongs_to :city
  belongs_to :trip

  has_many :activities #, dependent: :destroy

  #figure out how to ask user if they want to delete activities or not with part deletion.

  validates :name, :start_date, :end_date, presence: true

end
