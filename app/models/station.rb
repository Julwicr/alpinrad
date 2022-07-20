class Station < ApplicationRecord
  ALLOWABLE_CATEGORY = %i[dropoff pickup popup]
  enum category: ALLOWABLE_CATEGORY
  has_many :station_schedules
  has_many :bikes

  validates :name, :latitude, :longitude, :bike_capacity, :category, :description, presence: true
end
