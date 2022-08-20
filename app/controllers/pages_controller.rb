class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

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
end
