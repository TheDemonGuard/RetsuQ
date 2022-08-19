class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @restaurants = Restaurant.all

    @markers = @restaurants.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        image_url: helpers.asset_url("Location_Pin_Centered.png")
      }
    end
  end
end
