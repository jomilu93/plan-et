class Other < ApplicationRecord
  has_many :activities, :as => :activityable

end
