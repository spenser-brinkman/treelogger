class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  helper_method :current_user
  helper_method :logged_in?
  helper_method :today
  helper_method :humanize_date
  helper_method :oxfordize_list
  helper_method :greet
  helper_method :last_survey
  helper_method :current_survey

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
    if resource && resource.user != current_user
      redirect_back(fallback_location: root_path)
    end
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

  def greet
    case Time.now.hour
    when 4..11 then 'Good morning, '
    when 12..17 then 'Good afternoon, '
    when 18..23 then 'Good evening, '
    else
      'Hello, '
    end
  end

  def last_survey(tree)
    recent_survey(tree).inspections.find_by(tree_id: tree.id)
  end

  def current_survey(tree)
    tree.surveys.find_by(id: params[:survey]).inspections.find_by(tree_id: tree.id)
  end
  
  def recent_survey(resource)
    resource.surveys.find_by(date: resource.surveys.maximum("date"))
  end

end