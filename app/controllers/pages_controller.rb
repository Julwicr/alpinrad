class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home karte]

  def home
  end

  def karte
    @stations = Station.all
    @markers = @stations.map do |station|
      {
        name: station.name,
        latitude: station.latitude,
        longitude: station.longitude
      }
    end
  end
end
