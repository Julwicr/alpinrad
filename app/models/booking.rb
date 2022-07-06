class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :station
  has_many :bike_selections

  validates :date, :status, :total_price, presence: true
end
