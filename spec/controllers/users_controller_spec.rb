# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'GET #show' do
    it 'returns http success' do
      pending('show not implemented still')
      get :show
      expect(response).to have_http_status(:success)
    end
  end
end
