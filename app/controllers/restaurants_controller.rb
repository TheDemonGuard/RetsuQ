class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end


  def show
    # raise
  end
end
