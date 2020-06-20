class PartsController < ApplicationController

  def index
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @part = Part.new(part_params_create)
    authorize @part
    @part.trip = @trip
    if @part.save!
      redirect_to trip_path(@trip)
    else
      render 'trips/show'
    end
  end

  def update
    @part = Part.find(params[:id])
    authorize @part
    @trip = Trip.find(@part.trip.id)
    if @part.update!(part_params_edit)
      redirect_to trip_path(@trip)
    else
      render 'trips/show'
    end
  end

  def destroy
    @part = Part.find(params[:id])
    authorize @part
    @part.destroy
    redirect_to trip_path(@part)
  end

  private

  def set_part
    @part = Part.find(params[:id])
  end

  def part_params_edit
    params[:city] = City.find(params[:city][:city_id].to_i)
    params.permit(:name, :start_date, :end_date, :city)
  end

  def part_params_create
    params.permit(:name, :start_date, :end_date, :city_id, :trip_id)
  end

end
