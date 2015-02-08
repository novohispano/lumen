class Admin::UsersController < Admin::AdminController
  before_action :require_user!
end
