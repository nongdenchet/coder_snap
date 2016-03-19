module ApplicationHelper
  def current_user_img
    sign_in? ? image_tag(current_user.avatar, height: 36, width: 36,
                         style: 'vertical-align: sub', class: 'circle') : ''
  end

  def current_user_name
    sign_in? ? "#{current_user.name}" : 'Snappy Chat'
  end
end
