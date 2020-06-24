class Api::V1::CitiesController < Api::V1::BaseController
  before_action :set_city, only: [ :show ]

  def index
    @cities = policy_scope(City)
  end

  def show
  end

  private

  def set_city
    @city = City.find(params[:id])
    authorize @city  # For Pundit
  end


end
