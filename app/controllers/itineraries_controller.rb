class ItinerariesController < ApplicationController

  def index
    #@itineraries = policy_scope(current_user.itineraries.all)
    @itineraries = Itinerary.all
  end

  def show
    @itinerary = itinerary.find(params[:id])
    authorize @itinerary
    @itinerary_owner = @itinerary.user
    if user_itineraries.empty? or user_itineraries.last.date < Date.today
      @itinerary= Itinerary.new
    else
      @itinerary = @itinerary.where(user: current_user).first
    end
  end


   def new
    @itinerary = Itinerary.new()
    authorize @itinerary
  end

  def create
    @itinerary = Itinerary.new(itinerary_params)
    @itinerary.user = current_user
    authorize @itinerary
    if @itinerary.save
      redirect_to itinerary_path(@itinerary)
    else
      render :new
    end
  end

  def edit
    @itinerary = Itinerary.find(params[:id])
    authorize @meal
  end

  def update
    authorize @itinerary
    if @itinerary.update(itinerary_params)
      redirect_to itinerary_path(@itinerary)
    else
      render :edit
    end
  end

  def itinerary_params
    params[:itinerary].parse_date_select! :start_date
    params[:itinerary].parse_date_select! :end_date
    params.require(:itinerary).permit(:trip_name,
                                      :country,
                                      :start_date,
                                      :end_date,
                                      #photos: []
                                     )
  end

end
