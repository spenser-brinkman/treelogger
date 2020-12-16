module ApplicationHelper
  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end

  def authentication
    redirect '/login' if !logged_in?
  end

  def authorize(resource)
    redirect back if resource.user != current_user
  end

  def today
    DateTime.now.strftime("%Y-%m-%d")
  end
end