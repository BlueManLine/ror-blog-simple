class Admin::IndexController < AdminController
  def index
    session["user_return_to"] = admin_path

    if !user_signed_in?
      redirect_to new_admin_session_path
    end
  end
end
