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
    #authorize @trip
    @trip_owner = @trip.user
    @trip_activities = @trip.activities
    # if user_trips.empty? or user_trips.last.date < Date.today
    #   @trip= trip.new
    # else
    #   @trip = @trip.where(user: current_user).first
    # end
  end


   def new
    @trip = Trip.new()
    #authorize @trip
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    #authorize @trip
  #   if @trip.save
  #     redirect_to trip_path(@trip)
  #   else
  #     render :new
  #   end
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

  def set_meal
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
