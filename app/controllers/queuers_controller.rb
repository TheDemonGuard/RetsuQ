class QueuersController < ApplicationController
  def index
    @queuers = Queuer.find(params[:restaurant_id])
  end

  def show
    @queuers = Queuer.where(restaurant_id: params[:id])
  end

  def new
    @queue = Queuer.new
  end

  def create
    @user_id = current_user.id
    @queue = Queuer.new(queue_params)
    @queue.user_id = @user_id
    if @queue.save
      redirect_to queuer_path(@queue)
    else
      render :new
    end
  end

  private

  def queue_params
    params.require(:queue).permit(:size, :user_id, :restaurant_id)
  end

end
