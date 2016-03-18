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
  before_action :require_login
  before_action :check_readability, only: [:show]

  def index
    @messages = MessageDecorator.decorate_collection(
        current_user.load_received_messages
    )
  end

  def sent
    @messages = MessageDecorator.decorate_collection(
        current_user.load_sent_messages
    )
  end

  def show
    @message.update_attributes(seen: true)
  end

  def detail
    @message = Message.find(params[:id]).decorate
  end

  def new
  end

  def create
  end

  private
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
