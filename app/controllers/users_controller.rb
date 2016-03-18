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
  before_action :require_login, except: [:new, :create]

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
    @users = current_user.available_users.page(params[:page])
  end

  def block
    Relation.find_by(target_id: params[:id], user_id: current_user_id)
        .update_attributes(name: 'block')
    respond_to :js
  end

  def unblock
    Relation.find_by(target_id: params[:id], user_id: current_user_id)
        .update_attributes(name: 'friend')
    respond_to :js
  end

  def unfriend
    UnfriendService.new(current_user_id, params[:id]).unfriend
    respond_to :js
  end

  def blocks
    @blocks = current_user.blocks.page(params[:page])
  end

  def friends
    @friends = current_user.friends.page(params[:page])
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
