class StationSchedulesController < ApplicationController
  def create
    @station_schedule = StationSchedule.new(station_schedule_params)
    @station_schedule.station = Station.find(params[:station_id].to_i)
    @station_schedule.save
    redirect_to stations_path
  end

  def update

  end

  def destroy

  end

  private

  def station_schedule_params
    params.require(:station_schedule).permit(:start_date, :end_date)
  end
end
