class ProfilesController < ApplicationController

  def show
    authorize current_user
  end

  def update  #to do validation feedback
    authorize current_user
    current_user.update(user_params)
    redirect_to profile_path
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end

