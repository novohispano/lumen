module ApplicationHelper
  def not_admin_login_path?(request)
    request.env['PATH_INFO'] != admin_login_path
  end
end
