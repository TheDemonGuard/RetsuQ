class QueuersController < ApplicationController
  def show
    @queuers = Queuer.where(restaurant_id: params[:id])
    @restaurant = Restaurant.find(params[:id])
  end

  def index
    @restaurant = Restaurant.where(user_id: current_user.id)
    @queuers = Queuer.where(restaurant_id: @restaurant)

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
    def update
      @queuer = Queuer.find(params[:id])

      @queuer.update(queuer_params)

    end
  end

  def change_status
    @queuer = Queuer.find(params[:id])
    @queuer.update(status: params[:status])
    redirect_to queuers_path, notice: "Status updated to #{@queuer.status}"
  end

  private

  def queuer_params
    params.require(:queuer).permit(:size, :status)
  end
end
