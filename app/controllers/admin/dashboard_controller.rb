class Admin::DashboardController < Admin::AdminController
  def show
    @projects = Project.all
    @news     = News.all
    @photos   = Photo.all
    @users    = User.all
  end
end
