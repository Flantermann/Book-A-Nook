class BookingsController < ApplicationController
  def create
    @space = Space.find(params[:space_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.space = @space
    if @booking.save
      redirect_to space_path(@space), notice: "You have successfully sent a booking request"
    else
      render 'pages/home'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
