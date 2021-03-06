class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  add_flash_types :success,
                  :info,
                  :warning,
                  :danger

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def format_errors(model)
    model.errors.values.flatten.map(&:capitalize).join(". ") << "."
  end
end
