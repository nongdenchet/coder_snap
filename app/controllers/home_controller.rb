class HomeController < ApplicationController
  def index
    unless current_user
      @user = User.new
      redirect_to new_sessions_path
    end
  end
end
