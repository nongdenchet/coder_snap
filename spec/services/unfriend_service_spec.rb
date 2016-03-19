require 'rails_helper'

RSpec.describe UnfriendService do
  before(:each) do
    user = create(:user)
    target = create(:target)
    @service = UnfriendService.new
    @user_relation = create(:user_relation, user: user, target: target)
    @target_relation = create(:target_relation, user: target, target: user)
  end

  it 'should create relation' do
    expect(@user_relation.persisted?).to eq(true)
    expect(@target_relation.persisted?).to eq(true)
  end

  it 'should delete relations' do
    expect {
      @service.unfriend(@user_relation.user_id, @user_relation.target_id)
    }.to change(Relation, :count).by(-2)
  end

  it 'should delete relations' do
    expect {
      @service.unfriend(@target_relation.user_id, @target_relation.target_id)
    }.to change(Relation, :count).by(-2)
  end

  it 'should delete relations' do
    expect {
      @service.unfriend(@user_relation.target_id, @user_relation.user_id)
    }.to change(Relation, :count).by(-2)
  end

  it 'should delete relations' do
    expect {
      @service.unfriend(@target_relation.target_id, @target_relation.user_id)
    }.to change(Relation, :count).by(-2)
  end
end