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

  # POST /admin/users
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

  # GET /admin/users/1/edit
  def edit
    @user = User.find(params[:id])

    rescue ActiveRecord::RecordNotFound
      flash[:error] = "Sorry, but the user doesnt exists"
      redirect_to admin_users_url
  end

  # PATCH/PUT /admin/users/1
  def update
    @user = User.find(params[:id])

    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    respond_to do |format|
      if @user.update(params.require(:user).permit(:email, :password, :password_confirmation))
        format.html { redirect_to admin_users_url, notice: 'User was successfully updated.' }
        #format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        #format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

end
