class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @restaurants = Restaurant.all
    if params[:lat]
      # params[:dist] = 1000 (for demo from Osaka)
      @near_restaurants = Restaurant.near([params[:lat], params[:long]], params[:dist])
    else
      @markers = @restaurants.geocoded.map do |restaurant|
        {
          lat: restaurant.latitude,
          lng: restaurant.longitude,
          image_url: helpers.asset_url("Location_Pin_Centered.png"),
          info_window: render_to_string(partial: "info_window", locals: { restaurant: restaurant })
        }
      end
    end

    respond_to do |format|
      format.html
      format.json
    end
  end
end
