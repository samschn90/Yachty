class YachtsController < ApplicationController
  before_action :set_yacht, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @yachts = Yacht.all
    @markers = @yachts.geocoded.map do |yacht|
      {
        lat: yacht.latitude,
        lng: yacht.longitude
      }
    end
  end

  def show
  end

  def new
    @yacht = Yacht.new
  end

  def create
    @user = current_user
    @yacht = Yacht.new(yacht_params)
    @yacht.user = @user
    if @yacht.save
      redirect_to yacht_path(@yacht)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @yacht.update(yacht_params)
    redirect_to yacht_path(@yacht)
  end

  def destroy
    @yacht.destroy
    redirect_to yachts_path
  end

  private

  def set_yacht
    @yacht = Yacht.find(params[:id])
  end

  def yacht_params
    params.require(:yacht).permit(:title, :name, :length, :description, :category, :price, :photo)
  end
end
