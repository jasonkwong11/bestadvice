class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:secret]
  
  def index
    @posts = Post.all
  end
end