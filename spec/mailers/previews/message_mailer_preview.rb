# Preview all emails at http://localhost:3000/rails/mailers/message_mailer
class MessageMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/message_mailer/new_message_mail
  def new_message_mail
    MessageMailer.new_message_mail
  end

  # Preview this email at http://localhost:3000/rails/mailers/message_mailer/seen_message_mail
  def seen_message_mail
    MessageMailer.seen_message_mail
  end

end
