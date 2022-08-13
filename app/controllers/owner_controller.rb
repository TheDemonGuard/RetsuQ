class OwnerController < ApplicationController
  def dashboard
    @restaurant = current_user.restaurant
  end

  def queuers
    @queurs = Queuer.all
  end

  def show_next_queur
    @queuer = Queuer.find(params[:id])
  end
end
