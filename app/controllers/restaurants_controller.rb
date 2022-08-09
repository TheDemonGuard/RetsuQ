class RestaurantsController < ApplicationController

  def create
    my_temp_params = params.require(:restaurant).permit(:name, :address, :category, :price_range, :open_time, :close_time, :status, :capacity, :total_wait_time, :time_per_person)
    @restaurant = Restaurant.new(my_temp_params)
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

  end


  def update

  end


  def destroy

  end

end
