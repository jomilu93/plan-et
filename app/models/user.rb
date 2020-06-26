class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :trips, dependent: :destroy
  belongs_to :city

  has_one :profile

  def build_profile
    Profile.create(user: self)
  end

  validates :name, presence: true

  has_one_attached :photo

end
