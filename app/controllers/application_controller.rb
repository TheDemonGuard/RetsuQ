class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :get_queuer

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
