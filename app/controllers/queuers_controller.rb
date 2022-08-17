class QueuersController < ApplicationController
  include ActionView::RecordIdentifier # adds `dom_id`
  def show
    @queuer = Queuer.find(params[:id])
    restaurant_id = @queuer.restaurant_id
    @restaurant = Restaurant.find(restaurant_id)
    # <!-- Queue information -->
    @queue = Queuer.where(restaurant_id: @restaurant)
    # <!-- number of people waiting in the queue -->
    @number_of_people = 0
    @queue.each do |group|
      @number_of_people += group.size
    end
  end

  def index
    @restaurant = Restaurant.where(user_id: current_user.id)
    @total_queuers = Queuer.where(restaurant_id: @restaurant)
    @active_queuers = Queuer.where(restaurant_id: @restaurant, status: "queuing")
    @dining_queuers = Queuer.where(restaurant_id: @restaurant, status: "dining")
    @active_queuers = @active_queuers += @dining_queuers
    @total_queuers = @total_queuers.sort_by { |queue| queue.created_at }
    @active_queuers = @active_queuers.sort_by { |queue| queue.created_at }
    @dining_queuers = @dining_queuers.sort_by { |queue| queue.created_at }
    @total_queuers.reverse!
    @active_queuers.reverse!
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
    if @queuer.status == "completed"
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
    @queuer.update(status: "completed")
    @queuer.destroy
    redirect_to queuers_path, notice: "Group Was Removed"
  end

  def quick_remove
    @queuer = Queuer.find(params[:id])
    @queuer.update(status: "completed")
    @queuer.destroy
    redirect_to owner_path, notice: "Group Was Removed"
  end

  private

  def queuer_params
    params.require(:queuer).permit(:size, :status, :reservation_name)
  end
end
