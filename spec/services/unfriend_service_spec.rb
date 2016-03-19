require 'rails_helper'

RSpec.describe UnfriendService do
  before(:each) do
    @service = UnfriendService.new
    relation = Data.relation_sample
    @user_relation, @target_relation = relation[:user_relation], relation[:target_relation]
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