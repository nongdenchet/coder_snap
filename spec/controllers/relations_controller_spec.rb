# == Schema Information
#
# Table name: relations
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :integer
#  target_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  active     :boolean          default(FALSE)
#

require 'rails_helper'

RSpec.describe RelationsController, type: :controller do

end
