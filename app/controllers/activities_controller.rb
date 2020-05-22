class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:update, :destroy]
  def create
    @activity = Activity.new(activity_params)
    @itinerary = Itinerary.find(params[:itinerary_id])
    @activity.itinerary = @itinerary
    if @activity.save
      redirect_to itinerary_path(@activity)
    else
      render :new
    end
  end

  def update
    if @activity.save
      redirect_to itinerary_path(@activity)
    else
      render :new
    end
  end

  def destroy
    @activity.destroy
    redirect_to itinerary_path(@activity)
  end

  private

  def set_activity
    @activity = Acitivity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:name, :description, :end_time, :start_time, :interaty_id)
  end
end
