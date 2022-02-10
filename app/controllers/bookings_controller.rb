class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = current_user.bookings
  end

  def show; end

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

  # def mark_as_declined
  #   @booking = Booking.find(params[:id])
  #   @booking.status = "declined"
  #   @booking.save
  #   redirect_to dashboard_path
  # end

  def edit; end

  def update
    if @booking.update(booking_params)
      redirect_to booking_path(@booking), notice: "Your reply was sent!"
    end
  end

  def destroy
    @booking.destroy
    redirect_to dashboard_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status, :message, :reply)
  end
end
