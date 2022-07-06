class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :station
  has_many :bike_selections
  enum :status, %i[ok cancel pending]
  validates :date, :status, :total_price, presence: true
end
