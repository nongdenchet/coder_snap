class HomeController < ApplicationController
  def index
    redirect_to new_sessions_path unless current_user
  end
end
