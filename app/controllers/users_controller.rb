# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  description     :text
#

class UsersController < ApplicationController
  before_action :skip_login, only: [:new, :create]
  before_action :require_login, only: [:index]

  def new
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

  def index
    @users = current_user.available_users
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
