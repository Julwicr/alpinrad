class StationsController < ApplicationController
  def index
    redirect_to root_path if current_user.role == 'user'

    @stations = Station.all
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
