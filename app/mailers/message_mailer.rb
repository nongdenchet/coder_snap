class MessageMailer < ApplicationMailer
  def new_message_mail(id)
    @message = Message.find(id)
    mail(to: @message.recipient.email, subject: 'New message')
  end

  def seen_message_mail(id)
    @message = Message.find(id)
    mail(to: @message.sender.email, subject: 'Message seen')
  end
end
