class RemoveUpvoteFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :upvote, :string
  end
end
