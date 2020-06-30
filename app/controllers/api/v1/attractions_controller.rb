class Api::V1::AttractionsController < Api::V1::BaseController
  # acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  # before_action :set_city, only: [ :show, :update]

  def index
    if params[:query]
      @attractions = policy_scope(Attraction.where('lower(name) LIKE ?', "%#{params[:query]}%"))[0..5]
    else
      @attractions = policy_scope(Attraction)
    end
  end

end
