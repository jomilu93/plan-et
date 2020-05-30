class AccomodationsController < ApplicationController
  def show
    @accomodation = Accomodation.find(params[:part_id])
  end

  def destroy
    @accomodation = Accomodation.find(params[:part_id])
    @accomodation.destroy
    # redirect_to trip_path(@trip)
  end
end

