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

RSpec.describe Relation, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:target_id) }
  it { should belong_to(:user) }
  it { should respond_to(:active) }
  it { should belong_to(:target).class_name(User).with_foreign_key(:target_id) }
end
