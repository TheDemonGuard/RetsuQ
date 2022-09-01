class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :get_queuer

  def after_sign_in_path_for(resource)
    if current_user.role == "owner"
      owner_path
    else
      root_path
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
  end


  # def default_url_options
  #   { host: ENV["DOMAIN"] || "localhost:3000" }
  # end

  # run heroku config:set DOMAIN=www.my_product.com after
end
