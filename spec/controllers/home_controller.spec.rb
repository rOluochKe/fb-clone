# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET #index when the viewer is not logged' do
    it 'redirects to the users sign up page' do
      get :index
      expect(response).to redirect_to('/users/sign_in')
    end
  end

  describe 'GET #index when the viewer is logged in' do
    it 'returns http success' do
      @user = FactoryBot.create(:user)
      sign_in(@user)
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
