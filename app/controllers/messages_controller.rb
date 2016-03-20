# == Schema Information
#
# Table name: messages
#
#  id           :integer          not null, primary key
#  sender_id    :integer
#  recipient_id :integer
#  content      :text
#  seen         :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class MessagesController < ApplicationController
  before_action :require_login, except: [:show]
  before_action :get_friends, only: [:new, :create]
  before_action only: [:show] do
    require_login(message_path(params[:id]))
  end
  before_action :check_readability, only: [:show]

  def index
    @messages = current_user.load_received_messages(params[:page]).decorate
  end

  def sent
    @messages = current_user.load_sent_messages(params[:page]).decorate
  end

  def show
    if @message.update_attributes(seen: true)
      MessageMailer.seen_message_mail(@message.id).deliver_later
    end
  end

  def detail
    @message = Message.find(params[:id]).decorate
  end

  def new
    @message = Message.new
  end

  def create
    result = CreateMessageService.new(current_user, params).create
    if result[:success]
      flash[:notice] = 'Message has been sent'
      redirect_to messages_path
    else
      @errors = result[:errors]
      puts @errors
      render :new
    end
  end

  private
  def get_friends
    @friends = current_user.friends
  end

  def check_readability
    @message = Message.find(params[:id]).decorate
    if current_user != @message.recipient
      flash[:alert] = 'You can not read this message'
      redirect_to messages_path
    elsif @message.seen
      flash[:alert] = 'Message has alreay been read'
      redirect_to messages_path
    end
  end
end
