class Api::V1::CitiesController < Api::V1::BaseController
  # acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_city, only: [ :show, :update]

  def index
    if params[:query]
      @cities = policy_scope(City.where('lower(name) LIKE ?', "%#{params[:query]}%"))
    else
      @cities = policy_scope(City)
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

  def set_city
    @city = City.find(params[:id])
    authorize @city  # For Pundit
  end

  def city_params
    params.require(:city).permit(:name, :pais)
  end

  def render_error
    render json: { errors: @rcity.errors.full_messages },
      status: :unprocessable_entity
  end

end
