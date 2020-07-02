class Api::V1::HotelsController < Api::V1::BaseController
  # acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  # before_action :set_city, only: [ :show, :update]

  def index
    if params[:query] && params[:part_id]
      @city = Part.find(params[:part_id]).city
      @hotels = policy_scope(@city.hotels.where('name ILIKE ?', "%#{params[:query]}%"))[0..5]
    elsif params[:query]
      @hotels = policy_scope(Hotel.where('name ILIKE ?', "%#{params[:query]}%"))[0..5]
    else
      @hotels = policy_scope(Hotel)
    end
  end

end
