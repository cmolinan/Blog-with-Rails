require 'rails_helper'

RSpec.describe PostsController, type: :request do
  context '#index' do
    before(:each) do
      get '/users/1/posts'
    end
    it 'response status is correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
      expect(response).to render_template('index')
      expect(response).to render_template('posts/index')
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include('All posts for User #1')
    end
  end

  context '#show' do
    before(:each) do
      # In table posts exists a post with id:1 and user with id:1
      get '/users/1/posts/1'
    end
    it 'response status is correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
      expect(response).to render_template('show')
      expect(response).to render_template('posts/show')
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include('Post #1 of  user #1')
    end
  end
end
