class MealsController < ApplicationController
  def show
    @meal = Meal.find(params[:part_id])
  end

  def destroy
    @meal = Meal.find(params[:part_id])
    @meal.destroy
    # redirect_to trip_path(@trip)
  end
end
