require 'rails_helper'
RSpec.describe 'Posts Controller', type: :request do
  describe 'The Index action' do
    it 'should return an ok status ' do
      get '/users/:id/posts/'
      expect(response).to have_http_status(:ok)
    end

    it 'should return the index template' do
      get '/users/:id/posts/'
      expect(response).to render_template('index')
    end

    it 'should return the the given users posts list' do
      get '/users/:id/posts/'
      expect(response.body).to include('the given users posts list')
    end
  end
end
