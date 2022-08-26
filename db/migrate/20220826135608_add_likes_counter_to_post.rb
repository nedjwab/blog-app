class AddLikesCounterToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :LikesCounter, :integer
  end
end
