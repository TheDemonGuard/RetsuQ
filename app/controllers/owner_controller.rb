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

  def call_next_queuer
    @next_queuer = Queuer.where(restaurant_id: current_user.restaurant, status: "queuing").first
    if @next_queuer.nil?
      redirect_to owner_path, notice: "No queuers in queue"
    else
      @next_queuer.update(status: "dining")
      @next_queuer.save
      QueuerMailer.with(queuer: @next_queuer).next_queuer(@next_queuer).deliver_later
      redirect_to owner_path, notice: "Next queuer called"
    end
  end
end
