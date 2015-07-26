module ApplicationHelper
  def not_admin_login_path?(request)
    request.env['PATH_INFO'] != admin_login_path
  end

  def format_time(time)
    l(time.localtime)
  end

  def highlight_navbar_link(text, url, current_page)
    if url == current_page
      link_to text, url, class: 'highlight'
    else
      link_to text, url
    end
  end
end
