require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    user = User.create(name: 'Nedjwa', photo: 'link to photo', bio: 'student.',
                       PostsCounter: 0)
    post = Post.create(title: 'post1', text: 'First post', CommentCounter: 0, LikesCounter: 0,
                       user_id: user.id)
    Comment.create(post: post, user: user, text: 'Hi Nedjwa!')
    Comment.create(post: post, user: user, text: 'Hi Nedjwa!')
    Comment.new(post: post, user: user, text: 'Hi Nedjwa!')
  end

  before { subject.save }

  it 'should add a comment' do
    expect(subject).to be_valid
  end

  it 'should update comments counter' do
    expect(subject.post.CommentCounter).to eq 3
  end
end
