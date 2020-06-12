class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:update, :destroy]
  before_action :set_trip, except: [:destroy, :create]

  def index
    @activities = policy_scope(Activity)
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
    case params[:activity_type]
    when 'Meal'
      @meal = Meal.new(meal_params)
      authorize @meal
      @meal.city_id = 1
      @meal.restaurant_id = params[:meal][:restaurant_id]
      if @meal.save!
        @activity = Activity.new(activity_params)
        @activity.activityable = @meal
        @activity.save!
        redirect_to trip_path(@activity.part.trip)
      else
        raise
      end
    when 'Attraction'
      @activity = Activity.new(activity_params)
      @attraction = params[:attraction]
      @activity.activityable = @attraction
      if @activity.save!
        redirect_to trip_path(@activity.part.trip)
      else
        raise
      end
    when 'Accomodation'
      @accomodation = Accomodation.new(accomodation_params)
      authorize @accomodation
      @accomodation.city_id = 1
      @accomodation.hotel_id = params[:accomodation][:hotel_id]
      if @accomodation.save!
        @activity = Activity.new(activity_params)
        @activity.activityable = @accomodation
        @activity.save!
        redirect_to trip_path(@activity.part.trip)
      else
        raise
      end
    when 'Other'
      @other = Other.new(other_params)
      authorize @other
      @other.city_id = 1
      if @other.save!
        @activity = Activity.new(activity_params)
        @activity.activityable = @other
        @activity.save!
        redirect_to trip_path(@activity.part.trip)
      else
        raise
      end
    when 'Transportation'
      @transportation = Transportation.new(transportation_params)
      authorize @transportation
      @transportation.origin_city_id = params[:transportation][:origin_city_id]
      @transportation.destination_city_id = params[:transportation][:destination_city_id]
      if @transportation.save!
        @activity = Activity.new(activity_params)
        @activity.activityable = @transportation
        @activity.save!
        redirect_to trip_path(@activity.part.trip)
      else
        raise
      end
    end
  end

  def update
    case params[:activity_type]
    when 'Meal'
      @activity = Activity.find(params[:id])
      @meal = Meal.find(params[:id])
      authorize @activity
      authorize @meal
      @meal.city_id = 1
      @meal.restaurant_id = params[:meal][:restaurant_id]
      if @meal.update(meal_params) && @activity.update(activity_params)
        redirect_to trip_path(@trip)
      else
        raise
      end
    end
  end

  def destroy
    trip = @activity.part.trip
    authorize @activity
    @trip = @activity.part.trip
    @activity.destroy
    redirect_to trip_path(trip)
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def activity_params
    params[:start_time] = DateTime.strptime(params[:date] + params[:start_time], '%Y-%m-%d%H:%M')
    params[:end_time] = DateTime.strptime(params[:date] + params[:end_time], '%Y-%m-%d%H:%M')
    params.permit(:end_time, :start_time, :part_id)
  end

  def meal_params
    params.permit(:name, :address, :city_id, :restaurant_id)
  end

  def restaurant_params
    params.permit(:restaurant_id)
  end

  def accomodation_params
    params.permit(:name, :address, :city_id, :hotel_id)
  end

  def hotel_params
    params.permit(:hotel_id)
  end

  def attraction_params
    params.permit(:attraction_id)
  end

  def other_params
    params.permit(:name, :address, :city_id)
  end

  def transportation_params
    params.permit(:transportation, :transportation_type)
  end

end

