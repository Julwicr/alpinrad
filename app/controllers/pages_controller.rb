class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home karte]

  def home
  end

  def karte
  end
end
