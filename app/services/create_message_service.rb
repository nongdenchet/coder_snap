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
    errors
  end

  def create_message
    @params[:friends].each do |friend_id|
      @sender.sent_messages.create(content: @params[:content], recipient_id: friend_id)
    end
  end
end