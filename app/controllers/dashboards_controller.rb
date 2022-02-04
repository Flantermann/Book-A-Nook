class DashboardsController < ApplicationController
  def index
    @my_bookings = current_user.bookings
    @my_rentals = current_user.spaces
  end
end
