class ApplicationController < ActionController::Base
  
  helper_method :current_user
  helper_method :logged_in?
  helper_method :today?

  before_action :authentication

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end

  def authentication
    redirect_to root_path unless logged_in?
  end

  def authorize(resource)
    redirect back if resource.user != current_user
  end

  def today
    DateTime.now.strftime("%Y-%m-%d")
  end

end