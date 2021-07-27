class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:success] = "New post created!"
      redirect_to posts_path
    else
      flash.now[:error] = "Error in creating post"
      render :new
    end
  end

  def index
    @posts = Post.all
  end

  private

    def post_params
      params.require(:post).permit(:body)
    end
end
