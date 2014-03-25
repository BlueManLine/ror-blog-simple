class Admin::IndexController < AdminController
  def index
    session["admin_return_to"] = admin_path

    if !admin_signed_in?
      redirect_to new_admin_session_path
    end
  end
end
