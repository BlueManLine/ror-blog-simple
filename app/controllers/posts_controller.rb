class PostsController < ApplicationController
  before_action :load_post, only: [:show, :edit, :update, :destroy]
    
  # GET /posts
  def index
    @posts = Post.all
  end

  # GET /articles/1
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # PATCH/PUT /posts/1
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to posts_url, notice: 'Post was successfully updated.' }
        #format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        #format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    #binding.pry
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_url, notice: 'Post was successfully created.' }
        #format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        #format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post/1
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      #format.json { head :no_content }
    end
  end


    private
      # Use callbacks to share common setup or constraints between actions.
      def load_post
        @post = Post.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def post_params
        params.require(:post).permit(:title, :post)
      end
end
