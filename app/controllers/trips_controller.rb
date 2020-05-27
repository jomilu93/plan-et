class TripsController < ApplicationController
  before_action :set_trip, only: %i[edit update destroy show]

  def index
  #@trips = policy_scope(current_user.trips.all)
  @trips = Trip.all
  end

  def home
    @trips = Trip.all
  end

  def show
    @trip_owner = @trip.user
    @parts = @trip.parts
    @part = Part.find(params[:id])
    @activities = @part.activities.all
    @activity = Activity.new
  end

  def new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    #authorize @itinerary
     if @trip.save
       redirect_to trip_path(@trip)
     else
       render :new
     end
   end


  # def update
  #   #authorize @trip
  #   if @trip.update(trip_params)
  #     redirect_to trip_path(@trip)
  #   else
  #     render :new
  #   end
  # end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params[:trip].parse_date_select! :start_date
    params[:trip].parse_date_select! :end_date
    params.require(:trip).permit(:name,
                                      :description,
                                      :start_date,
                                      :end_date,
                                      #photos: []
                                     )
  end

end
