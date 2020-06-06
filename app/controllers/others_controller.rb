class OthersController < ApplicationController
  def show
    @other = Other.find(params[:part_id])
  end

  def destroy
    @other = Other.find(params[:part_id])
    @other.destroy
    # redirect_to trip_path(@trip)
  end
end
