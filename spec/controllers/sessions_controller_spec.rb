require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  before(:each) do
    @user = create(:user)
  end

  context 'GET #new' do
    it 'should render new page' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'should skip login' do
      session[:user_id] = @user.id
      get :new
      expect(response).to redirect_to(root_path)
    end
  end

  context 'POST #create' do
    context 'valid email password' do
      before(:each) do
        post :create, email: 'nongdenchet@gmail.com', password: 'androidDeveloper'
      end

      it 'should login successfully' do
        expect(response).to redirect_to(root_path)
      end

      it 'should show successful flash' do
        expect(flash[:notice]).to eq('Login successfully')
      end

      it 'should store user id' do
        expect(session[:user_id]).to eq(@user.id)
      end
    end

    context 'skip login' do
      it 'should skip login' do
        session[:user_id] = @user.id
        post :create, email: 'aaa', password: 'aaa'
        expect(response).to redirect_to(root_path)
      end
    end

    context 'invalid email password' do
      before(:each) do
        post :create, {email: 'nongdenchet@gmail.com', password: '123'}
      end

      it 'should show invalid flash' do
        expect(flash[:alert]).to eq('Invalid email or password')
      end

      it 'should render new' do
        expect(response).to render_template(:new)
      end
    end
  end

  context 'DELETE #destroy' do
    before(:each) do
      session[:user_id] = @user.id
    end

    it 'should redirect to login page' do
      post :destroy
      expect(response).to redirect_to(new_sessions_path)
    end

    it 'should delete session' do
      post :destroy
      expect(session[:user_id]).to be_nil
    end

    it 'should show flash' do
      session[:user_id] = @user.id
      post :destroy
      expect(flash[:notice]).to eq('Logout successfully')
    end
  end
end
