require 'rails_helper'
RSpec.describe User, type: :model do
  it 'tests recent method' do
    user2 = User.new(name: 'nedjwa', photo: 'photo', bio: 'this is a bio', PostCounter: 0)
    Post.create(user: user2, title: 'Hello', text: 'This is my first post')
    Post.create(user: user2, title: 'Hello', text: 'This is my first post')
    Post.create(user: user2, title: 'Hello', text: 'This is my first post')
    Post.create(user: user2, title: 'Hello', text: 'This is my first post')
    expect(user2.user_posts).to eq(user2.posts.five_recent_comments(3))
  end
end
