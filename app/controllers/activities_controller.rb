class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:update, :destroy]
  before_action :set_trip, except: [:destroy, :create, :update]

  def index
    @activities = policy_scope(Activity)
  end

  def create
    case params[:activity_type]
    when 'Meal'
      @meal = Meal.new(meal_params)
      authorize @meal
      # @meal.restaurant_id = params[:meal]
      # @meal.city_id = @meal.restaurant.city_id
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
      @attraction = Attraction.where(name: "#{params[:attraction]}")[0]
      @activity.activityable = @attraction
      authorize @activity
      if @activity.save!
        redirect_to trip_path(@activity.part.trip)
      else
        raise
      end
    when 'Accomodation'
      @accomodation = Accomodation.new(accomodation_params)
      authorize @accomodation
      # @accomodation.hotel_id = params[:accomodation][:hotel_id]
      # @accomodation.city_id = @accomodation.hotel.city_id
      @accomodation.name = "Blank name"
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
      @other.city_id = Part.find(params[:part_id]).city_id
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
      # @transportation.origin_city_id = params[:transportation][:origin_city_id]
      # @transportation.destination_city_id = params[:transportation][:destination_city_id]
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
      @meal = @activity.activityable
      authorize @activity
      authorize @meal
      # @meal.restaurant_id = params[:meal][:restaurant_id]
      # @meal.city_id = @meal.restaurant.city_id
      if @meal.update(meal_params) && @activity.update(activity_params)
        redirect_to trip_path(@activity.part.trip)
      else
        raise
      end
    when 'Attraction'
      @activity = Activity.find(params[:id])
      @attraction = Attraction.where(name: "#{params[:attraction]}")[0]
      authorize @activity
      @activity.activityable = @attraction
      if @activity.update(activity_params)
        redirect_to trip_path(@activity.part.trip)
      else
        raise
      end
    when 'Accomodation'
      @activity = Activity.find(params[:id])
      @accomodation = @activity.activityable
      authorize @activity
      # @accomodation.hotel_id = params[:accomodation][:hotel_id]
      # @accomodation.city_id = @accomodation.hotel.city_id
      if @accomodation.update(accomodation_params) && @activity.update(activity_params)
        redirect_to trip_path(@activity.part.trip)
      else
        raise
      end
    when 'Other'
      @activity = Activity.find(params[:id])
      @other = @activity.activityable
      authorize @other
      @other.city_id = @activity.part.city_id
      if @other.update(other_params) && @activity.update(activity_params)
        redirect_to trip_path(@activity.part.trip)
      else
        raise
      end
    when 'Transportation'
      @activity = Activity.find(params[:id])
      @transportation = @activity.activityable
      authorize @transportation
      # @transportation.origin_city_id = params[:transportation][:origin_city_id]
      # @transportation.destination_city_id = params[:transportation][:destination_city_id]
      if @transportation.update(transportation_params) && @activity.update(activity_params)
        redirect_to trip_path(@activity.part.trip)
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
    params.permit(:end_time, :start_time, :part_id, :notes)
  end

  def meal_params
    params[:restaurant_id] = Restaurant.where(name:"#{params[:restaurant]}").ids[0]
    params[:city_id] = Restaurant.where(name:"#{params[:restaurant]}")[0].city_id
    params.permit(:name, :address, :city_id, :restaurant_id)
  end

  def restaurant_params
    params.permit(:restaurant_id)
  end

  def accomodation_params
    params[:city_id] = Hotel.where(name: "#{params[:hotel]}")[0].city.id
    params[:hotel_id] = Hotel.where(name: "#{params[:hotel]}")[0].id
    params.permit(:address, :city_id, :hotel_id)
  end

  def hotel_params
    params.permit(:hotel_id)
  end

  def attraction_params
    params.permit(:attraction_id)
  end

  def other_params
    # params[:city_id] = Part.find(params[:part_id]).city_id
    params.permit(:name, :address, :city_id)
  end

  def transportation_params
    params[:origin_city_id] = City.where(name: "#{params[:origin_city]}")[0].id
    params[:destination_city_id] = City.where(name: "#{params[:destination_city]}")[0].id
    params.permit(:transportation, :transportation_type, :origin_city_id, :destination_city_id)
  end

end

