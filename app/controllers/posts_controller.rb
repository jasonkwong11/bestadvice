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
      flash[:notice] = "Please enter a valid post."
      redirect_to new_post_path
    end
  end

  def show
    @comment = Comment.new
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
  end

  def upvote
    @post = Post.find(params[:post_id])
    @post.votes += 1
    @post.save
    redirect_to :back
  end

  def downvote
    @post = Post.find(params[:post_id])
    @post.votes -= 1
    @post.save
    redirect_to :back
  end

end


private
  
  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end
