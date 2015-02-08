class Admin::AdminController < ApplicationController
  def require_user!
    redirect_to admin_login_path unless current_user
  end
end
