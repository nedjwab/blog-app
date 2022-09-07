require 'rails_helper'
describe 'Posts-show', type: :feature do
  describe 'users/posts/show' do
    before(:each) do
      @user_one = User.create! name: 'ikram', photo: 'https://unsplash.com/photos/l-T-LpQnNRg', bio: 'designer', PostsCounter: 0
      @user_two = User.create! name: 'nedjwa', photo: 'https://unsplash.com/photos/l-T-LpQnNRg', bio: 'developper', PostsCounter: 0
      @post1 = @user_one.posts.create!(title: 'first post', text: 'description', CommentCounter: 0, LikesCounter: 0)
      @post2 = @user_one.posts.create!(title: 'second post', text: 'description', CommentCounter: 0, LikesCounter: 0)
      @comment_one = @post1.comments.create!(text: 'comment one', user_id: @user_one.id)
      @comment_two = @post1.comments.create!(text: 'comment two', user_id: @user_two.id)
      @like = @post1.likes.create!(user_id: @user_one.id)
      visit(user_post_path(@user_one.id, @post1.id))
    end
    scenario "can see the post's title." do
      expect(page).to have_content('first post')
    end
    scenario 'I can see who wrote the post.' do
      expect(page).to have_content('first post by: ikram')
    end
    scenario 'I can see how many comments it has.' do
      expect(page).to have_content('Comments: 2')
    end
    scenario 'I can see how many likes it has.' do
      expect(page).to have_content('Likes: 1')
    end
    scenario 'I can see the post body.' do
      expect(page).to have_content('description')
    end
    scenario 'I can see the comment each commentor left.' do
      expect(page).to have_content('comment one')
      expect(page).to have_content('comment two')
    end
    scenario 'I can see the username of each commentor' do
      expect(page).to have_content('ikram')
      expect(page).to have_content('nedjwa')
    end
  end
end
