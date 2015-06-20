class IndexColumns < ActiveRecord::Migration
  def change
  end
  add_index :posts, :user_id
  add_index :posts, :comment_id
  add_index :users, :post_id
  add_index :comments, :user_id
  add_index :comments, :post_id
end
