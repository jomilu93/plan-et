class ActivitiesController < ApplicationController
  before_action :set_part, only: [:update, :destroy]

  def index
    @activities = Activity.all
  end

  def create
    # raise
    # TODO: We need to get the following information in the request: (accessible through params)
    # PartID [MANDATORY]
    # Activity Type [MANDATORY]
    # Activity attributes [MANDATORY] (start_time, end_time)
    # The selected Activity attributes (e.g. Meal attributes)
    #
    # Then we need to follow this logic:
    # 1. We get the Part instance with the PartID from the request
    # 2. We create an Activity instance (Activity.new)
    # 3. We assign the Part to the Activity
    # 4. We do a case statement with the Acitvity type value.
    # e.g.
    # case ACTIVITY_TYPE
    # when 'meal'
    #   Meal.create
    # when 'attraction'
    #   Attraction.create
    # end
    #
    # We need to store the instance of any of those activities in a variable, to later assign it to the Activity
    # 5. Assign the Activityable to the Activity
    # 6. Save the Activityable to the DB
    # 7. Save the Activity to the DB
    binding.pry
    @part = Part.find(params[:part_id])
    @activity = Activity.new(activity_params)
    @activity.part = @part
    @activity.activityable_type = params.values_at("activity_type")
    case @activity.activityable_type.gsub(/[\[\]"\\]/,"")
    when 'meal'
      @meal = Meal.new(meal_params)
      @meal.city_id = 1
      @meal.restaurant_id = 1
    if @meal.save!
      @activity.activityable_id = @meal.id
      @activity.save!
    else
      raise
    end
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
    @activity = Activity.find(params[:part_id])
    @activity.destroy
    redirect_to trip_path(@trip)
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.permit(:end_time, :start_time, :activity_type, :name, :address, :city_id)
  end

  def meal_params
    params.permit(:name, :address, :city_id)
  end
end
