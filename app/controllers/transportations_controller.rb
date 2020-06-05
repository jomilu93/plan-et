class TransportationsController < ApplicationController
  def show
    @transportation = Transportation.find(params[:part_id])
  end

  def destroy
    @transportation = Transportation.find(params[:part_id])
    @transportation.destroy
    # redirect_to trip_path(@trip)
  end
end
