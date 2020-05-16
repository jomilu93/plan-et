class User < ApplicationRecord

  has_many :users, through: :friends

  validates :name, :email, :password, :location, presence: true

end
