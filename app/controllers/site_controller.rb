class SiteController < ApplicationController
  before_action :redirect_to_admin!

  def show
    @photos     = Photo.slider
    @metrics    = Highlight.metrics
    @history    = Highlight.history.first
    @projects   = Project.home
  end

  private

  def redirect_to_admin!
    redirect_to admin_path if current_user
  end
end
