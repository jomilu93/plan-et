class Itinerary < ApplicationRecord
  belongs_to :user
  has_many :activities

  validates :trip_name, :start_date, :end_date, presence: true
  #validates :end_date_after_start_date

  private

  #def end_date_after_start_date 
  #  if end_date < start_date
  #    errors.add(:end_date, "must be after the start date")
  #  end
  #end

end
