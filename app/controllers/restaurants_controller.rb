class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    # Have to create a new review here b/c it's nested within Restaurants
    @review = Review.new
  end
end
