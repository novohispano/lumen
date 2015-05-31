class Admin::AdminController < ApplicationController
  before_action :require_user!
  
  def require_user!
    redirect_to admin_login_path unless current_user
  end
end
