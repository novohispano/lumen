class Admin::DashboardController < Admin::AdminController
  before_action :require_user!

  def show
    @projects = %w(blah hello)
    @news     = %w(blah hello)
    @photos   = Photo.all
    @users    = User.all
  end
end
