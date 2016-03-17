class UsersController < ApplicationController
  def new
    redirect_to root_path if current_user
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      store_user_id(@user.id)
      flash[:notice] = 'Register successfully'
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end