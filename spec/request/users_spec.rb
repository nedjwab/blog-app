require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:all) do
    @first_user = User.create(name: 'nedjwa', photo: 'photo', bio: 'test')
  end

  describe 'GET index' do
    it 'renders index' do
      get :index
      expect(response.status).to eq(200)
      expect(response).to render_template('index')
    end
  end

  describe 'GET show' do
    it 'renders show ' do
      get :index
      expect(response.status).to eq(200)
      expect(response).to render_template(:index)
    end
  end
end
