class Admin::UsersController < AdminController
  before_filter :authenticate_user!

  # GET /admin/users
  def index
    @users = User.order("id DESC").all
  end

  # GET /admin/users/new
  def new
    @user = User.new
  end

  # PUT /admin/users
  def create
    @user = User.new(params.require(:user).permit(:email, :password, :password_confirmation))

    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_users_url, notice: 'User was successfully added.' }
        #format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        #format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end

  end

end
