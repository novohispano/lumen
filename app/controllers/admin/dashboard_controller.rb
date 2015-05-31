class Admin::DashboardController < Admin::AdminController
  def show
    @projects = Project.all
    @news     = %w(blah hello)
    @photos   = Photo.all
    @users    = User.all
  end
end
