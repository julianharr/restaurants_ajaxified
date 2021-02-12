class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all

    # When the request has been triggered, did you get HTML or JSON
    respond_to do |format|
      # Depending on the 'Accept' of requests... render HTML or handle JSON
      format.html
      format.json { render json: { restaurants: @restaurants } }
    end

  end

  def show
    @restaurant = Restaurant.find(params[:id])
    # Have to create a new review here b/c it's nested within Restaurants
    @review = Review.new
  end

  # When we delete, we stay on the Restaurants index page without reloading
  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    # If there is a long list, add an anchor so it redirects to the point on the page
    redirect_to restaurants_path
  end
end
