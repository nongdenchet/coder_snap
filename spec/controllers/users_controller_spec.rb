require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context 'GET #new' do
    it 'should render new' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  context 'POST #create' do
    context 'create account successfully' do
      before(:each) do
        post :create, user: attributes_for(:user)
      end

      it 'should register successfully' do
        expect(User.count).to eq(1)
        expect(User.first.name).to eq('nongdenchet')
      end

      it 'should show success flash' do
        post :create, user: attributes_for(:user)
        expect(flash[:notice]).to eq('Register successfully')
      end

      it 'should show success flash' do
        post :create, user: attributes_for(:user)
        expect(flash[:notice]).to eq('Register successfully')
      end
    end

    context 'register fail' do
      it 'should render new' do
        post :create, user: attributes_for(:user, email: '123')
        expect(response).to render_template(:new)
      end
    end
  end
end
