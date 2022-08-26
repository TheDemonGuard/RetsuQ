class QueuersController < ApplicationController
  include ActionView::RecordIdentifier # adds `dom_id`
  # before_action :wait_time

  def show
    @queuer = Queuer.find(params[:id])
    restaurant_id = @queuer.restaurant_id
    @restaurant = Restaurant.find(restaurant_id)
    # <!-- Queue information -->
    @queuers = Queuer.where(restaurant_id: @restaurant, status: "queuing")
    @queuers = @queuers.sort_by { |queue| queue.created_at }
    @position = @queuers.find_index(@queuer) + 1
    p @position
    @queuers = @queuers.take(@position)
    # <!-- number of people waiting in the queue -->
    @number_of_people = 0
    @queuers.each do |group|
      @number_of_people += group.size
    end
    # <!-- wait time  -->
    @time = @queuer.wait_time
    # <!-- Estimated Dining time  -->
    @dine_time = @queuer.estimated
    # <!-- Current restaurant location  -->
    @markers = [{
      lat: @restaurant.latitude,
      lng: @restaurant.longitude,
      image_url: helpers.asset_url("Location_Pin_Centered_Pink.png")
      # info_window: render_to_string(partial: "info_window", locals: { restaurant: restaurant })
    }]
  end

  def index
    @restaurant = Restaurant.where(user_id: current_user.id)
    # <!-- Active Queuers -->
    @queuers = Queuer.where(restaurant_id: @restaurant, status: "queuing")
    @dining_queuers = Queuer.where(restaurant_id: @restaurant, status: "dining")
    @queuers = @queuers += @dining_queuers
    @queuers = @queuers.sort_by { |queue| queue.created_at }
    # <!-- Total Queuers -->
    @total_queuers = Queuer.where(restaurant_id: @restaurant)
    @total_queuers = @total_queuers.sort_by { |queue| queue.created_at }
    # <!-- Number of active customers -->
    @number_of_people = 0
    @queuers.each do |group|
      @number_of_people += group.size
    end
  end

  def new
    @queuer = Queuer.new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @username = current_user.email.split("@")[0]
  end

  def create
    @user_id = current_user.id
    @queuer = Queuer.new(queuer_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @queuer.restaurant = @restaurant
    @queuer.user_id = @user_id
    @queuer.status = "queuing"
    if @queuer.save
      QueuerMailer.with(queuer: @queuer).new_queuer(@queuer).deliver_later
      redirect_to queuer_path(@queuer)
    else
      render :new
    end
  end

  def update
    @queuer = Queuer.find(params[:id])
    @queuer.update(queuer_params)
  end

  def change_status
    @queuer = Queuer.find(params[:id])
    @queuer.update(status: params[:status])
    if params[:status] == "completed"
      redirect_to queuers_path, notice: "Status updated to #{@queuer.status}"
    else
      redirect_to queuers_path(anchor: dom_id(@queuer)), notice: "Status updated to #{@queuer.status}"
    end
  end

  def destroy
    @queuer = Queuer.find(params[:id])
    @restaurant = @queuer.restaurant
    @queuer.destroy
    redirect_to restaurant_path(@restaurant)
  end

  def remove_queuer
    @queuer = Queuer.find(params[:id])
    @queuer.destroy
    redirect_to queuers_path, notice: "Group Was Removed"
  end

  def quick_remove
    @queuer = Queuer.find(params[:id])
    @queuer.destroy
    redirect_to owner_path, notice: "Group Was Removed"
  end

  private

  def queuer_params
    params.require(:queuer).permit(:size, :status, :reservation_name)
  end
end
