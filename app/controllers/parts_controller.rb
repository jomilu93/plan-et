class PartsController < ApplicationController
  before_action :set_part, only: [:update, :destroy]

  def index
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @part = Part.new(part_params)
    @part.trip = @trip
    # FIXME: Add a City or update the schema. Next line is temporary. Please REMOVE IT.
    @part.city = City.first
    
    if @part.save!
      redirect_to trip_path(@trip)
    else
      render 'trips/show'
    end
  end

  def update
    @trip = Trip.find(params[:trip_id])
    @part.save
    if @part.save
      redirect_to trip_path(@trip)
    else
      render 'trips/show'
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
