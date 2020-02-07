# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:post) do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post)
  end
  describe 'GET #index' do
    it 'returns http success' do
      @user = FactoryBot.create(:user)
      sign_in(@user)
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      pending('still not implemented')
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #edit' do
    it 'returns http success' do
      pending('still not implemented')
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it 'creates a post' do
      pending('is it failing because there is no logged user?')
      post_params = FactoryBot.attributes_for(:post)
      expect { post :create, params: { protocol: post_params } }.to change(Post, :count).by(1)
    end
  end

  describe 'POST #delete' do
    it 'deletes a post' do
      pending('yet to implement')
      expect { post :destroy }.to change(Post, :count).by(-1)
    end
  end

  describe 'POST #delete' do
    it 'can not delete a post not created by current user' do
      pending('yet to implement')
      expect { post :destroy }.to change(Post, :count).by(-1)
    end
  end

  describe 'POST #update' do
  end

  describe 'POST #update' do
    it 'can not update a post not created by current user' do
      pending('yet to implement')
      expect { post :update }.to
    end
  end
end
