class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
    # raise
  end


  def show
    # raise
  end
end
