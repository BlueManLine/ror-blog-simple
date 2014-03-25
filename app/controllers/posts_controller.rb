class PostsController < ApplicationController

  # GET /posts
  def index
    @posts = Post.order("id DESC").all
  end

  # GET /articles/1
  def show
    @post = Post.find(params[:id])
  end

end
