class CreateMessageService
  def initialize(sender, params)
    @sender = sender
    @params = params
  end

  def create
    errors = validate
    if !errors.empty?
      {success: false, errors: errors}
    else
      create_message
      {success: true}
    end
  end

  private
  def validate
    errors = []
    errors << 'Content must not be empty' if @params[:content].blank?
    errors << 'Please add at least one friend' if @params[:friends].blank?
    errors << 'Some people are not your friends' unless check_friends
    errors
  end

  def check_friends
    if @params[:friends]
      (@params[:friends].map(&:to_i) - @sender.friends.pluck(:id)).empty?
    else
      true
    end
  end

  def create_message
    @params[:friends].each do |friend_id|
      id = @sender.sent_messages.create(content: @params[:content], recipient_id: friend_id)
      MessageMailer.new_message_mail(id).deliver_later
    end
  end
end