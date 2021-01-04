class ApplicationController < ActionController::Base
  
  helper_method :current_user
  helper_method :logged_in?
  helper_method :today
  helper_method :humanize_date
  helper_method :oxfordize_list

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
    redirect_back(fallback_location: root_path) if resource.user != current_user
  end

  def today
    DateTime.now.strftime("%Y-%m-%d")
  end

  def humanize_date(date)
    date.strftime("%B %e, %Y")
  end

  def oxfordize_list(list)
    return list.join(' and ') if list.size < 3
    list[-1] = "and " + list[-1]
    list.join(', ')
  end

end