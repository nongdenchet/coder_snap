class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionHelper
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by_id(current_user_id)
  end
end
