class ItinerariesController < ApplicationController
  def index
    #@itineraries = policy_scope(current_user.itineraries.all)
    @itineraries = Itinerary.all
  end

  def home
    if not params[:search].blank?
      @itineraries = Itinerary.where("trip_name ilike?", "%#{params[:search]}%")
      @query = params[:search]
    else
      @query = nil
      @itineraries = Itinerary.all
      #@meals = Meal.geocoded
    end
    #@markers = @meals.map do |meal|
    #    {lat: meal.latitude,
    #     lng: meal.longitude,
    #     infoWindow: render_to_string(partial: "infowindow", locals: { meal: meal })
    #   }
    # end
    #@itineraries = policy_scope(@itineraries)
  end

  def show
    @itinerary = Itinerary.find(params[:id])
    @itinerary_days = (@itinerary.end_date - @itinerary.start_date).to_i
    @itinerary_dates = [@itinerary.start_date]
    until @itinerary_dates.length == @itinerary_days
      @itinerary_dates << @itinerary.start_date += 1
    end

    @activities = @itinerary.activities.all
    #authorize @itinerary
    #@itinerary_owner = @itinerary.user
    #if user.itineraries.empty? or user_itineraries.last.date < Date.today
    #  @itinerary = Itinerary.new
    #else
    #  @itinerary = @itinerary.where(user: current_user).first
    #end
  end


   def new
    @itinerary = Itinerary.new()
    #authorize @itinerary
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
