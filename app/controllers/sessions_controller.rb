class SessionsController < ApplicationController
  def new
    redirect_to root_path if current_user
  end

  def create
    if authenticate
      store_user_id(@user.id)
      flash[:notice] = 'Login successfully'
      redirect_to root_path
    else
      flash[:alert] = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    clear_user_id
    flash[:notice] = 'Logout successfully'
    redirect_to new_sessions_path
  end

  private
  def authenticate
    @user = User.find_by(email: params[:email])
    @user && @user.authenticate(params[:password])
  end
end
