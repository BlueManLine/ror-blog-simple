class PostsController < ApplicationController
    def index
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



    private
    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :post)
    end
end
