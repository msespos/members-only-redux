class PostsController < ApplicationController
  before_action :require_login, only: [:new, :create]
  def new
    @post = Post.new
  end

  def create
  end

  def index
  end

  private

    def require_login
      unless logged_in?
        flash[:error] = "You must be logged in to access this section"
        redirect_to new_user_session_path # halts request cycle
      end
    end

    def logged_in?
      !current_user.nil?
    end
end
