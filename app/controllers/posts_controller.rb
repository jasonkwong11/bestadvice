class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post
    else
      redirect_to :root
    end
  end

  def show
    @post = Post.find(params[:id])
  end

end


private
  
  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end
