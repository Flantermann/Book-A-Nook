class BookingsController < ApplicationController

  def index
    @bookings = current_user.bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @space = Space.find(params[:space_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.space = @space
    if @booking.save
      redirect_to dashboard_path, notice: "You have successfully sent a booking request"
    else
      render 'pages/home'
    end
  end

  def mark_as_accepted
    @booking = Booking.find(params[:id])
    @booking.status = "confirmed"
    @booking.save
    redirect_to dashboard_path
  end

  def add_reply
    # ???
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status, :message, :reply)
  end
end
