class Activity < ApplicationRecord
  belongs_to :activityable, polymorphic: true
  belongs_to :itinerary
  has_many :users, through: :travel_interest

  validates :name, :description, :end_time, :start_time, presence: true
  #validate :end_date_after_start_date

  private

  #def end_date_after_start_date 
  #  return if end_time.blank? || start_time.blank?  

   # if end_time < start_time
    #  errors.add(:end_time, "must be after the start time")
    #end
  #end

end
