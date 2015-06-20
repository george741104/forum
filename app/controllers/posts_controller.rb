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
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:notice] = "Post was successfully created"
      redirect_to posts_path
      else
        render :action => :new
    end
  end

  def edit
  end

  def update

    if @post.update(post_params)
      flash[:notice] = "Post was successfully updated"
      redirect_to posts_path
      else
      flash[:alert] = "Topic can't be blank"
        render :action => :edit
    end
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
      params.require(:post).permit(:topic, :content, :user_id)
    end


end
