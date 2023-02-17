class BookingsController < ApplicationController
  before_action :set_booking, only: %w[show edit update destroy]
  before_action :authenticate_user!

  def index
    @bookings = Booking.all
  end

  def show
  end

  def create
    @booking = Booking.new(booking_params)
    @yacht = Yacht.find(params[:yacht_id])
    @booking.yacht = @yacht
    @booking.user = current_user
    if @booking.save
      redirect_to yachts_path(@yacht)
      flash[:message] = "Your request has been successfully submitted!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @yacht = Yacht.find(params[:yacht_id])
    @booking = Booking.new
    # start_time = [:start_time]
    # end_time = params[:end_time]

    # if @yacht.available?(start_time, end_time)
    #   @booking = Booking.new(start_time, end_time)
    # else
    #   flash[:error] = "Sorry mate, your fancy flashy yacht is not available during that time."
    #   redirect_to yachts_path
    # end
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    # redirect_to user_path(@user)
  end

  def destroy
    @booking.destroy
    # redirect_to user_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:user, :yacht, :start_time, :end_time, :total_price, :status)
  end
end
