class BookingsController < ApplicationController
  before_action :set_restaurant, only: %w[show edit update destroy]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.yachts = @yacht
    @booking.save
    redirect_to yacht_path(@yachts)
  end

  def new
    @booking = Booking.new
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    # redirect_to user_path(@user)
  end

  def destroy
    @booking.destroy
    redirect_to user_path, status: :see_other
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:user, :yacht, :start_time, :end_time)
  end
end
