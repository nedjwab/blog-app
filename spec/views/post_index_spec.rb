require 'rails_helper'
describe 'Posts-index', type: :feature do
  describe 'users/posts/index' do
    before(:each) do
      @user_one = User.create! name: 'ikram', photo: 'https://unsplash.com/photos/l-T-LpQnNRg', bio: 'designer', PostsCounter: 0
      @user_two = User.create! name: 'nedjwa', photo: 'https://unsplash.com/photos/l-T-LpQnNRg', bio: 'developper', PostsCounter: 0

      @post1 = @user_one.posts.create!(title: 'first post', text: 'description', CommentCounter: 0, LikesCounter: 0)
      @post2 = @user_one.posts.create!(title: 'second post', text: 'description', CommentCounter: 0, LikesCounter: 0)
      @comment_one = @post1.comments.create!(text: 'comment one', user_id: @user_one.id)
      @comment_two = @post1.comments.create!(text: 'comment two', user_id: @user_two.id)

      visit(user_posts_path(@user_one.id))
    end
    scenario 'I can see the users profile picture.' do
      expect(page).to have_selector('span')
    end
    scenario "I can see the user's username" do
      expect(page).to have_content('ikram')
    end
    scenario 'I can see the number of posts the user has written' do
      expect(page).to have_content('Number of posts: 4')
    end
    scenario "I can see some of the post's body." do
      expect(page).to have_content('description')
    end
    scenario 'I can see the first comments on a post.' do
      expect(page).to have_content('comment one')
    end
    scenario 'I can see how many comments a post has.' do
      expect(page).to have_content('Comments: 2')
    end
    scenario 'I can see how many likes a post has.' do
      expect(page).to have_content('Likes: 0')
    end
    it "When I click on a post, it redirects me to that post's show page." do
      visit(user_post_path(@user_one.id, @post1.id))
      expect(page).to have_current_path user_post_path(@user_one.id, @post1.id)
    end
  end
end
