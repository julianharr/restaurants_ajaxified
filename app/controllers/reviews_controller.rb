class ReviewsController < ApplicationController
  def create
    # Find the Restaurant (thanks to the Nesting in the routes)
    @restaurant = Restaurant.find(params[:restaurant_id])

    # Create the review from the param content of the form
    @review = Review.new(review_params)

    # Link the Review to the Restaurant
    @review.restaurant = @restaurant

    # If Save, Redirect, else render restaurants/show
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      # Form is on the show page so we just need render this page
      render 'restaurants/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
