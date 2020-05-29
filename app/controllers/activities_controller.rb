class ActivitiesController < ApplicationController
  before_action :set_part, only: [:update, :destroy]

  def index
    @activities = Activity.all
  end

  def create

    @part = Part.find(params[:part_id])
    @activity = Activity.new(activity_params)

    @activity.part = @part
    if @activity.save
      redirect_to part_path(@activity)
    else
      render :new
    end
  end

  def update
    if @activity.save
      redirect_to trip_path(@part)
    else
      render :new
    end
  end

  def destroy
    @activity.destroy
    redirect_to trip_path(@part)
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:name, :description, :end_time, :start_time, :activityable_type)
  end
end
