# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  description     :text
#  avatar          :string
#

require 'rails_helper'

RSpec.describe User, type: :model do

  # Attributes
  it { should validate_length_of(:password).is_at_least(8) }
  it { should respond_to(:password_confirmation) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should_not allow_value('test@test').for(:email) }
  it { should_not allow_value('android').for(:email) }
  it { should_not allow_value('ios.@..c').for(:email) }
  it { should allow_value('vuhuyquan@apidez.com').for(:email) }
  it { should have_secure_password }
  it { should respond_to(:avatar) }
  it { should respond_to(:avatar_url) }
  it { should respond_to(:remote_avatar_url) }

  # Association
  it { should have_many(:relations).dependent(:destroy) }
  it { should have_many(:friend_relations).class_name(Relation).conditions(name: 'friend', active: true) }
  it { should have_many(:block_relations).class_name(Relation).conditions(name: 'block', active: true) }
  it { should have_many(:sent_messages).class_name(Message).with_foreign_key(:sender_id).dependent(:destroy) }
  it { should have_many(:received_messages).class_name(Message).with_foreign_key(:recipient_id).dependent(:destroy) }
  it { should have_many(:friends).through(:friend_relations).source(:target) }
  it { should have_many(:blocks).through(:block_relations).source(:target) }
end
