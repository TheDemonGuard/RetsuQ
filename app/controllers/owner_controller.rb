class OwnerController < ApplicationController
  def dashboard
    @restaurant = current_user.restaurant
    @queuers = Queuer.where(restaurant_id: @restaurant, status: "queueing")
    @next_queuer = Queuer.where(restaurant_id: current_user.restaurant, status: "queuing").first
    if @next_queuer.nil?
      redirect_to owner_path, notice: "No queuers in queue"
    end
  end

  def queuers
    @queurs = Queuer.all
  end
end
