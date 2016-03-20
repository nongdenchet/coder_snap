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
  before(:each) do
    @user = create(:user)
    @target = create(:target)
  end

  context 'POST #create' do
    it 'should require login' do
      post :create, {id: @target.id, format: :js}
      expect(response).to redirect_to new_sessions_path
    end

    it 'should create relation' do
      session[:user_id] = @user.id
      expect {
        post :create, {id: @target.id, format: :js}
      }.to change(@user.relations, :count).by(1)
      expect(@user.relations.first.target).to eq(@target)
    end
  end

  context 'GET #index' do
    it 'should require login' do
      get :index
      expect(response).to redirect_to new_sessions_path
    end

    it 'should create relation' do
      session[:user_id] = @user.id
      create(:target_relation, user: @target, target: @user)
      get :index
      expect(assigns(:relations).count).to eq(1)
    end
  end

  context 'POST #confirm' do
    it 'should require login' do
      post :confirm, {id: @target.id, format: :js}
      expect(response).to redirect_to new_sessions_path
    end

    it 'should create relation' do
      session[:user_id] = @user.id
      relation = create(:target_relation, user: @target, target: @user)
      post :confirm, {id: relation.id, format: :js}
      expect(@user.relations.first.active).to eq(true)
      expect(@target.relations.first.active).to eq(true)
    end
  end
end
