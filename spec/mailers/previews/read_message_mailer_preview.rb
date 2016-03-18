# Preview all emails at http://localhost:3000/rails/mailers/read_message_mailer
class ReadMessageMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/read_message_mailer/seen_message_mail
  def seen_message_mail
    ReadMessageMailer.seen_message_mail
  end

end
