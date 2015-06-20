class PostUsersController < ApplicationController
  before_action :set_post
  def index
    @user = @post.user
  end

  def create
    @user = @post.user.build
    @user.save
  end



  protected

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_user
    @user = User.find(:user_id)
  end

  def user_params
      params.require(:user).permit(:name, :email)
  end
end
