# == Schema Information
#
# Table name: messages
#
#  id           :integer          not null, primary key
#  sender_id    :integer
#  recipient_id :integer
#  content      :text
#  seen         :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe Message, type: :model do
  it { should validate_presence_of(:sender_id) }
  it { should validate_presence_of(:recipient_id) }
  it { should validate_presence_of(:content) }
  it { should respond_to(:seen) }
  it { should belong_to(:sender).class_name(User).with_foreign_key(:sender_id) }
  it { should belong_to(:recipient).class_name(User).with_foreign_key(:recipient_id) }
  it 'should have seen default equal false' do
    @message = Message.create(sender_id: 1, recipient_id: 2)
    expect(@message.seen).to eq(false)
  end
end
