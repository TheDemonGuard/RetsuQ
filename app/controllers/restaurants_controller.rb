require 'rubygems'
require 'rufus-scheduler'
class RestaurantsController < ApplicationController
  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user_id = current_user.id

    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @restaurant = Restaurant.new
  end

  def index
    @restaurants = Restaurant.all
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    # Rufus::Scheduler.singleton.running_jobs.each(&:unschedule)
    # Rufus::Scheduler.singleton.shutdown
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(total_wait_time: @restaurant.wait_time)

    @category = @restaurant.category
    @recommended_restaurants = Restaurant.where(category: @category)
    @review = Review.new

    respond_to do |format|
      format.html
      format.json
    end
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

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :description, :category, :price_range, :open_time, :close_time, :status, :capacity, :total_wait_time, :time_per_person)
  end
end
