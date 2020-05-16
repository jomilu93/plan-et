class Transit < ApplicationRecord
  belongs_to :activity, as: :activityable
end
