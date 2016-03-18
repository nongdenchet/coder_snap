class MessageDecorator < Draper::Decorator
  delegate_all

  def short_content
    object.content.truncate(100, separator: ' ')
  end

  def class_for_card
    object.seen ? 'grey darken-1' : 'blue darken-1'
  end

  def create_time
    object.created_at.strftime('%d/%m/%Y - %I:%M%p')
  end
end
