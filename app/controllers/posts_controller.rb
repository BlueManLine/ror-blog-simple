class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    
    # GET /posts
    def index
        @posts = Post.all
    end

    # GET /posts/new
    def new
        @post = Post.new
    end

    # POST /posts
    def create
        @post = Post.new(post_params)

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
        def set_post
          @post = Post.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def post_params
          params.require(:post).permit(:title, :post)
        end
end
