require 'rails_helper'

RSpec.describe Like, type: :model do
  subject do
    user = User.create(name: 'Nedjwa', photo: 'link to photo', bio: 'student.',
                       PostsCounter: 0)
    post = Post.create(title: 'post1', text: 'First post', CommentCounter: 0, LikesCounter: 0,
                       user_id: user.id)
    Like.create(post_id: post.id, user_id: user.id)
    Like.new(post_id: post.id, user_id: user.id)
  end

  before { subject.save }

  it 'Add the like' do
    expect(subject).to be_valid
  end

  it 'should update posts like counter' do
    expect(subject.post.LikesCounter).to eq 2
  end
end
