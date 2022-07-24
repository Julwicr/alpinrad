class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home karte]

  def home
  end

  def karte
    @stations = Station.where(shown: true)
    @markers = @stations.map do |station|
      {
        name: station.name,
        latitude: station.latitude.to_f,
        longitude: station.longitude.to_f,
        schedules: station.station_schedules
      }
    end
  end
end
