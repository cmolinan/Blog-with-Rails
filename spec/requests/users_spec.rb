require 'rails_helper'

RSpec.describe UsersController, type: :request do
  context '#index' do
    before(:each) do
      get '/users'
    end
    it 'response status is correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
      expect(response).to render_template('index')
      expect(response).to render_template('users/index')
    end

    it 'renders the index template at root path' do
      get root_path
      expect(response).to render_template(:index)
      expect(response).to render_template('index')
      expect(response).to render_template('users/index')
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include('Show All users:')
    end
  end

  context '#show' do
    before(:each) do
      # In table Users exists many users
      get '/users/1'
    end
    it 'response status is correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
      expect(response).to render_template('show')
      expect(response).to render_template('users/show')
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include('User Info: 1')
    end
  end
end
