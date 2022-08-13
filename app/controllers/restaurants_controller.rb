class RestaurantsController < ApplicationController

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user_id = current_user.id

    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      raise
      render :new
    end
  end


  def new
    # @restaurant = Restaurant.find(params[:restaurant_id])
    @restaurant = Restaurant.new
  end


  def index
    @restaurants = Restaurant.all
  end


  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.update(restaurant_params)
      redirect_back(fallback_location: "/")
    else
      render :edit
    end

  end

  def destroy

  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :description, :category, :price_range, :open_time, :close_time, :status, :capacity, :total_wait_time, :time_per_person)
  end

end
