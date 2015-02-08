class Admin::DashboardController < Admin::AdminController
  before_action :require_user!
  
  def show
  end
end
