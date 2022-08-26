require 'rails_helper'
RSpec.describe Post, type: :model do
  subject do
    user = User.create(name: 'ikram', photo: 'link to a photo', bio: 'developper',
                       PostsCounter: 0)
    Post.create(title: 'post1', text: 'This is my first post', CommentCounter: 0, LikesCounter: 0, user: user)
    Post.create(title: 'post2', text: 'This is my second post', CommentCounter: 0, LikesCounter: 0, user: user)
    Post.new(title: 'post3', text: 'This is my third post', CommentCounter: 0, LikesCounter: 0, user: user)
  end

  before { subject.save }

  it 'title should not be blank' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'comments counter should be greater or equal to 0' do
    subject.CommentCounter = -1
    expect(subject).to_not be_valid
  end

  it 'likes counter should be greater or equal to 0' do
    subject.LikesCounter = -1
    expect(subject).to_not be_valid
  end

  it 'should update posts counter' do
    expect(subject.user.PostsCounter).to eq 3
  end

  it 'returns the last 5 comments' do
    Comment.create(post: subject, user: subject.user, text: 'comment1')
    Comment.create(post: subject, user: subject.user, text: 'comment2')
    Comment.create(post: subject, user: subject.user, text: 'comment3')
    Comment.create(post: subject, user: subject.user, text: 'comment4')
    Comment.create(post: subject, user: subject.user, text: 'comment5')
    Comment.create(post: subject, user: subject.user, text: 'comment6')
    Comment.create(post: subject, user: subject.user, text: 'comment7')
    expect(subject.five_recent_comments.length).to eq 5
    expect(subject.five_recent_comments[0].text).to eq 'comment7'
  end
end
