require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new
  user2 = User.new(name: 'Nedjwa', photo: 'link to photo', bio: 'a microverse student')

  it 'should not create user because name is not given' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'should not accecpt negative values for post counter' do
    user.PostsCounter = -2
    expect(user).to_not be_valid
  end

  it 'tests recent method' do
    Post.create(user: user2, title: 'Hello', text: 'This is my first post')
    Post.create(user: user2, title: 'Hello', text: 'This is my first post')
    Post.create(user: user2, title: 'Hello', text: 'This is my first post')
    Post.create(user: user2, title: 'Hello', text: 'This is my first post')
    expect(user2.user_posts).to eq(user2.posts.last(3))
  end
end