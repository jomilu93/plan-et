class AttractionsController < ApplicationController
  def show
    @attraction = Attraction.find(params[:part_id])
  end

  def destroy
    @attraction = Attraction.find(params[:part_id])
    @attraction.destroy
    # redirect_to trip_path(@trip)
  end
end
