class PostsController < ApplicationController
  before_action:set_post, only:[:show, :edit,:update, :destroy]

  def index
    @posts = Post.all
  end
  def show

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    #@event.user = current_user
    @post.save
    redirect_to posts_path
  end
  def destroy
    @post.destroy

    redirect_to posts_path
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end
    def post_params
      params.require(:post).permit(:topic, :content)
    end


end
