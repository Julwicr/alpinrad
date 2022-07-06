class StationSchedule < ApplicationRecord
  belongs_to :station

  validates :start_date, :end_date, presence: true
end
