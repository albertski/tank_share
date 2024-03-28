# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tanks', type: :request do
  describe 'GET /new' do
    it 'returns http success' do
      get '/tanks/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/tanks/create'
      expect(response).to have_http_status(:success)
    end
  end
end
