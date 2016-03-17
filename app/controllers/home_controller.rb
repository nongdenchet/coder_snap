class HomeController < ApplicationController
  def index
    if current_user
      @messages = current_user.sent_messages.preload(:recipient)
    else
      redirect_to new_sessions_path unless current_user
    end
  end
end
