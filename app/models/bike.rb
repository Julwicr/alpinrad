class Bike < ApplicationRecord
  enum :category, %i[mountain trekking eBike MTB]
  enum :size, %i[S M L XL]
  enum :state, %i[excellent good need_repair urgent_repair]

  belongs_to :station, optional: true

  validates :category, :weight, :size, :state, :price_per_day, presence: true
end
