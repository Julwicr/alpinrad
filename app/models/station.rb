class Station < ApplicationRecord
  enum :category, %i[dropoff pickup popup]
  has_many :station_schedules
  has_many :bikes

  validates name :name, :address, :latitude, :longitude, :bike_capacity, :category, :description, presence: true
end
