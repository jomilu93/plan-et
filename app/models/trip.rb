class Trip < ApplicationRecord
  #include PgSearch::Model

  belongs_to :user

  has_many :parts, dependent: :destroy

  has_many_attached :photos

  validates :name, :start_date, :end_date, presence: true


   #pg_search_scope :search_by_trip,
    #against: [ :name, :description ],
    #associated_against: {
    #  part: [ :name, :city]
    #},
    #using: {
    #  tsearch: { prefix: true }
    #}

end
