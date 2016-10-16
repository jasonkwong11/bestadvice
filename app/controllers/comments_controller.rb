class CommentsController < ApplicationController
 
  before_filter :determine_scope
  before_action :determine_post

  def index
    @comments = @scope.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to post_comments_path
    else
      flash[:notice] = "Please enter a valid comment."
      redirect_to post_path(@post)
    end
  end

protected
  def determine_scope
    @scope = if params[:post_id]
      Post.find(params[:post_id]).comments
    else
      Comment
    end
  end

  def determine_post
    @post = if params[:post_id]
      Post.find(params[:post_id])
    end
  end

private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end  
end