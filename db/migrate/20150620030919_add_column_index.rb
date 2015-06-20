class AddColumnIndex < ActiveRecord::Migration
  def change
    add_column :users, :post_id, :integer
    add_column :posts, :user_id, :integer
    add_column :posts, :comment_id, :integer
    add_column :comments, :post_id, :integer
    add_column :comments, :user_id, :integer
  end

end
