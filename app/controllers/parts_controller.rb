class PartsController < ApplicationController
  before_action :set_activity, only: [:update, :destroy]before_action :set_activity, only: [:update, :destroy]
  def index
  end

  def create
    @part = Part.new(part_params)
    @trip = Trip.find(params[:itinerary_id])
    @part.itinerary = @itinerary
    if @part.save
      redirect_to trip_path(@part)
    else
      render :new
    end
  end

  def update
    if @part.save
      redirect_to trip_path(@part)
    else
      render :new
    end
  end

  def destroy
    @part.destroy
    redirect_to trip_path(@part)
  end

  private

  def set_part
    @part = Part.find(params[:id])
  end

  def part_params
    params.require(:part).permit(:name, :start_date, :end_date)
  end

end
