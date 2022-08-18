class OwnerController < ApplicationController
  def dashboard
    @restaurant = current_user.restaurant
    @queuers = Queuer.where(restaurant_id: @restaurant, status: "queueing")
  end

  def queuers
    @queurs = Queuer.all
  end

  def next_queuer
    @queuer = Queuer.where(restaurant_id: current_user.restaurant, status: "queueing").first
    if @queuer.nil?
      redirect_to owner_path, notice: "No queuers in queue"
    end
  end
end
