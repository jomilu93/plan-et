class TripsController < ApplicationController

    def index
    #@itineraries = policy_scope(current_user.itineraries.all)
    @trips = Trip.all
  end

  def home
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
    #authorize @itinerary
    @trip_owner = @trip.user
    @trip_activities = @trip.activities
    # if user_itineraries.empty? or user_itineraries.last.date < Date.today
    #   @itinerary= Itinerary.new
    # else
    #   @itinerary = @itinerary.where(user: current_user).first
    # end
  end


   def new
    @trip = Trip.new()
    #authorize @itinerary
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
  #   #authorize @itinerary
  #   if @itinerary.update(itinerary_params)
  #     redirect_to itinerary_path(@itinerary)
  #   else
  #     render :new
  #   end
  # end

  def trip_params
    #params[:trip].parse_date_select! :start_date
    #params[:trip].parse_date_select! :end_date
    params.require(:trip).permit(:name,

                                      :start_date,
                                      :end_date,
                                      photos: []
                                     )
  end

end
