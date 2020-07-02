class Api::V1::RestaurantsController < Api::V1::BaseController
  # acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_restaurant, only: [ :show, :update]

  def index
    if params[:query]
      @city = City.find(params[:city_id])
      @restaurants = policy_scope(@city.restaurants.where('name ILIKE ?', "%#{params[:query]}%"))[0..5]
      # @restaurants = policy_scope(Restaurant.where('name ILIKE ?', "%#{params[:query]}%"))[0..5]
    else
      @restaurants = policy_scope(Restaurant)
    end
  end

  def show
  end

  # def update
  #   if @rcity.update(city_params)
  #     render :show
  #   else
  #     render_error
  #   end
  # end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant  # For Pundit
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :cuisine, :rating, :avg_price, :business_hours, :address, :phone_number, :city)
  end

  def render_error
    render json: { errors: @rrestaurant.errors.full_messages },
      status: :unprocessable_entity
  end

end
