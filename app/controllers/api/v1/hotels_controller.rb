class Api::V1::HotelsController < Api::V1::BaseController
  # acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  # before_action :set_city, only: [ :show, :update]

  def index
    if params[:query]
      @hotels = policy_scope(Hotel.where('lower(name) LIKE ?', "%#{params[:query]}%"))[0..5]
    else
      @hotels = policy_scope(Hotel)
    end
  end

end
