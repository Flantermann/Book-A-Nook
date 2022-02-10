class DashboardsController < ApplicationController
  def index
    @my_bookings = current_user.bookings
    @my_rentals = current_user.spaces
    @bookings_of_rentals = []
      @my_rentals.each do |rental|
        rental.bookings.each do |booking|
          @bookings_of_rentals << booking
        end
      end
  end
end
