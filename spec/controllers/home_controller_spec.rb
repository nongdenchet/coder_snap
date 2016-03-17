require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  before(:each) do
    @user = create(:user)
  end

  context 'GET #index' do
    it 'should render home/index' do
      session[:user_id] = @user.id
      get :index
      expect(response).to render_template(:index)
    end

    it 'should redirect to login' do
      get :index
      expect(response).to redirect_to(new_sessions_path)
    end

    it 'should not render index' do
      get :index
      expect(response).not_to render_template(:index)
    end
  end
end
