class DashboardsController < ApplicationController
  def index
    @current_user = bookings_url
    @current_user = spaces_url
  end
end
