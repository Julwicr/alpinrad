class StationsController < ApplicationController
  def index
    redirect_to root_path if current_user.role == 'user'
    @stations = Station.all
    @station_schedule = StationSchedule.new
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

  def toggle_shown
    @station = Station.find(params[:id])
    @station.shown ? @station.shown = false : @station.shown = true
    @station.save
    redirect_to stations_path
  end

  private

  def station_params
    params.require(:station).permit(:name, :category, :description, :latitude, :longitude, :bike_capacity)
  end
end
