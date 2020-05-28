class Part < ApplicationRecord
  belongs_to :city
  belongs_to :trip

  has_many :activities #, dependent: :destroy

  #figure out how to ask user if they want to delete activities or not with part deletion.

  validates :name, :start_date, :end_date, presence: true

  def part_dates_array
    part_days = (self.end_date - self.start_date).to_i
    part_dates = [self.start_date]
    until part_dates.length == part_days
      part_dates << self.start_date += 1
    end
    part_dates
  end
end
