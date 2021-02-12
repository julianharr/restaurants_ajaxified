class ApplicationController < ActionController::Base
  # Before ANY action on any controller, do this:
  before_action :set_counter

  private

  def set_counter
    @restaurant_count = Restaurant.count
  end
end
