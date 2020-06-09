class TripsController < ApplicationController
  #before_action :set_trip, only: %i[edit update destroy show]

  def index
  @trips = policy_scope(Trip)
  end

  def home
    if params[:search].present?

      # sql_query = " \ trips.name ILIKE :query OR trips.description ILIKE :query\ "

      # @trips = policy_scope(Trip.where(sql_query, query: "%#{params[:query]}%"))
      @parts = policy_scope(Part.search_for_parts("%#{params[:search]}%"))
      @trips_all = []
      @parts.each do |part|
        @trips_all << part.trip
      end

    @trips = @trips_all.uniq

    else
      @trips = policy_scope(Trip)
    end
  end

  def show
    @trip = Trip.find(params[:id])
    authorize @trip
    @trip_owner = @trip.user
    @parts = @trip.parts
    #@part = Part.find(params[:id])
    @activities = []
    @parts.each do |part|
      part.activities.all.each do |activity|
        @activities << activity
      end
    end
    @part_new = Part.new
    # FIXME: The following line is incorrect. The params[:id] means the Trip ID/
    # @part = Part.find(params[:id])
    @activity = Activity.new
  end

  def new
    @trip = Trip.new
    authorize @trip
  end

  def create
    @trip = Trip.new(trip_params)
    authorize @trip
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

  #def set_trip
  #  @trip = Trip.find(params[:id])
  #end

  def trip_params
    #params[:trip].parse_date_select! :start_date
    #params[:trip].parse_date_select! :end_date
    params.require(:trip).permit(:name,
                                      :description,
                                      :start_date,
                                      :end_date,
                                      photos: []
                                     )
  end

end
