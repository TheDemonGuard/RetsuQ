class QueuersController < ApplicationController
  def show
    @queuers = Queuer.where(restaurant_id: params[:id])
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
    if @queuer.save
      redirect_to queuer_path(@queuer)
    else
      render :new
    end
  end

  private

  def queuer_params
    params.require(:queuer).permit(:size)
  end
end
