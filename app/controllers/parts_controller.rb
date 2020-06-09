class PartsController < ApplicationController
  before_action :set_part, only: [:update, :destroy]

  def index
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @part = Part.new(part_params)
    authorize @part
    @part.trip = @trip
    if @part.save!
      @trip.cities << @part.city.name
      @trip.countries << @part.city.pais.name
      @trip.save!
      redirect_to trip_path(@trip)
    else
      render 'trips/show'
    end
  end

  def update
    @trip = Trip.find(params[:trip_id])
    authorize @part
    @part.save
    if @part.save
      @trip.cities << @part.city.name
      @trip.countries << @part.city.pais.name
      redirect_to trip_path(@trip)
    else
      render 'trips/show'
    end
  end

  def destroy
    authorize @part
    @part.destroy
    redirect_to trip_path(@part)
  end

  private

  def set_part
    @part = Part.find(params[:id])
  end

  def part_params
    params.require(:part).permit(:name, :start_date, :end_date, :city_id)
  end

end
