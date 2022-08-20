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
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    job_id =
      Rufus::Scheduler.singleton.every '5s' do
        Rails.logger.info "TEST ME time flies, it's now #{Time.now}"
        wait_time
      end
    puts "TEST ME scheduled job #{job_id}"
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

  def wait_time
    # <!-- All restaurants -->
    Restaurant.all.each do |restaurant|
      capacity = restaurant.capacity
      # <!-- People who are dining -->
      dining_queuers = Queuer.where(restaurant_id: restaurant, status: "dining")
      diners = 0
      dining_queuers.each do |queue|
        diners += queue.size
      end
      # <!-- People who are queuing -->
      queuers = Queuer.where(restaurant_id: restaurant, status: "queuing")
      people = 0
      queuers.each do |queue|
        people += queue.size
      end
      if diners + people <= capacity
        wait_time = 0
      else
        wait_time = (diners + people) - capacity
        wait_time *= restaurant.time_per_person
      end
      restaurant.update(total_wait_time: wait_time)
    end
  end
end
