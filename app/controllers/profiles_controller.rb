class ProfilesController < ApplicationController

  def show
    @user = current_user
    authorize @user

  end

  def update  #to do validation feedback
    @user = current_user
    authorize @user
    if @user.update(user_params)
      redirect_to profile_path
    else
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :description, :date_of_birth, :city_id, :phone_number)
  end
end

