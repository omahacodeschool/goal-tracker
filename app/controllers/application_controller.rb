class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_login
  
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    end
  end
  
  helper_method :current_user
  
  private
  def not_authenticated
    redirect_to login_path, alert: "Please login first"
  end
end
