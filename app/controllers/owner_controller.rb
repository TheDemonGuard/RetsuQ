class OwnerController < ApplicationController
  def dashboard
    @restaurant = current_user.restaurant
    @queuers = Queuer.where(restaurant_id: @restaurant, status: "queuing")
    @dining_queuers = Queuer.where(restaurant_id: @restaurant, status: "dining")
    @queuers = @queuers += @dining_queuers
    @queuers = @queuers.sort_by { |queue| queue.created_at }
  end

  def queuers
    @queurs = Queuer.all
  end

  def show_next_queur
    @queuer = Queuer.find(params[:id])
  end
end
