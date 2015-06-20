class PostsController < ApplicationController
  before_action:set_post, only:[:show, :edit,:update, :destroy]

  def index
    @posts = Post.all
    @posts = @posts.page( params[:page]).per(15)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    #@event.user = current_user
    @post.save
    redirect_to posts_path
  end

  def edit
  end

  def update
    @post.update(post_params)

    redirect_to posts_path(@post)
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
