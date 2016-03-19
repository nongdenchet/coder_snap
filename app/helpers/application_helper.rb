module ApplicationHelper
  def current_user_img
    sign_in? ? current_user.avatar : ''
  end

  def current_user_name
    sign_in? ? "#{current_user.name}" : 'Snappy Chat'
  end
end
