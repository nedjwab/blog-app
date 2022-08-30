require "rails_helper"
RSpec.describe "User Controller", :type => :request do
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
end