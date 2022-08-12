class QueuersController < ApplicationController
  def show
    @queuer = Queuer.find(params[:id])
    restaurant_id = @queuer.restaurant_id
    @restaurant = Restaurant.find(restaurant_id)
    # @queuers = Queuer.where(restaurant_id: params[:id])
    # @restaurant = Restaurant.find(params[:id])
  end

  def index
    @restaurant = Restaurant.where(user_id: current_user.id)
    @queuers = Queuer.where(restaurant_id: @restaurant)

    # @username = current_user.email.split("@")[0]
    # @restaurant = Restaurant.find(params[:id])
    # @queuer = Queuer.where(restaurant_id: params[:id])

    @queuers = Queuer.where("user_id = restaurant_id")
    @queuer = Queuer.find(params[:id])
    @restaurant = @queuer.restaurant

    # @queuer = Queuer.find(params[:id])
    # @restaurant = @queuer.restaurant

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
    redirect_to queuers_path, notice: "Status updated to #{@queuer.status}"
  end

  def destroy
    @queuer = Queuer.find(params[:id])
    @restaurant = @queuer.restaurant
    @queuer.destroy
    redirect_to restaurant_path(@restaurant)
  end

  private

  def queuer_params
    params.require(:queuer).permit(:size, :status)
  end
end
