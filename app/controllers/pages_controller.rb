class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  before_action :get_queuer

  def home
    @restaurants = Restaurant.all

    @markers = @restaurants.geocoded.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude,
        image_url: helpers.asset_url("Location_Pin_Centered.png"),
        info_window: render_to_string(partial: "info_window", locals: { restaurant: restaurant })
      }
    end
  end

  def get_queuer
    # @user_id = current_user.id
    # raise
    if current_user.present?
      @queuer = Queuer.find_by(user: current_user)
    else
      @queuer = nil
    end
    p "------------------------------------------"
    p @queuer
    p "------------------------------------------"
  end
end
