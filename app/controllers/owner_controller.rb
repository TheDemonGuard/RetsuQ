class OwnerController < ApplicationController
  def dashboard
    @restaurant = current_user.restaurant
    @queuers = Queuer.where(restaurant_id: @restaurant, status: "queuing")
    @queuers = @queuers.sort_by { |queue| queue.created_at }
    @queuers.reverse!
  end

  def queuers
    @queurs = Queuer.all
  end

  def show_next_queur
    @queuer = Queuer.find(params[:id])
  end
end
