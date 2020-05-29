class PartsController < ApplicationController
  before_action :set_part, only: [:update, :destroy]

  def index
  end

  def create
    @part = Part.new(part_params)
    @trip = Trip.find(params[:trip_id])
    @part.trip = @trip
    @part.save
    # if @part.save
    #   redirect_to trip_path(@part)
    # else
    #   redirect_to trip_path(@part)
    # end
  end

  def update
    @part.save
    # if @part.save
    #   redirect_to trip_path(@part)
    # else
    #   redirect_to trip_path(@part)
    # end
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
