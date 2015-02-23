module ApplicationHelper
  def not_admin_login_path?(request)
    request.env['PATH_INFO'] != admin_login_path
  end

  def format_time(time)
    time.localtime.strftime('%B %e, %Y - %l:%M %p')
  end
end
