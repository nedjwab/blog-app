require 'rails_helper'
RSpec.describe 'User Controller', type: :request do
  describe 'The Index action' do
    it 'should return an ok status ' do
      get '/users/'
      expect(response).to have_http_status(:ok)
    end

    it 'should return the index template' do
      get '/users/'
      expect(response).to render_template('index')
    end

    it 'should return the Users list' do
      get '/users/'
      expect(response.body).to include('Users list')
    end
  end

  describe 'The show action' do
    it 'should return an ok status ' do
      get '/users/:id'
      expect(response).to have_http_status(:ok)
    end

    it 'should return the show template' do
      get '/users/:id'
      expect(response).to render_template('show')
    end

    it 'should return the user profil' do
      get '/users/:id'
      expect(response.body).to include('user profil')
    end
  end
end
