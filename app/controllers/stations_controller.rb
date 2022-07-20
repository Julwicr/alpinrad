class StationsController < ApplicationController
  def index
    redirect_to root_path if current_user.role == 'user'
    @stations = Station.all
  end

  def new
    @station = Station.new
  end

  def create
    @station = Station.new(station_params)
    if @station.save
      redirect_to stations_path
    else
      render "stations/new", status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def station_params
    params.require(:station).permit(:name, :category, :description, :latitude, :longitude, :bike_capacity)
  end
end
