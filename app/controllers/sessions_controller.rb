class SessionsController < ApplicationController
  
  skip_before_action :authentication, only: [:welcome, :new, :create]

  def welcome
  end
  
  def new
    @user = User.new
  end

  def create
    redirect_to root_path
  end

  def googleAuth
    user = User.find_or_create_by(uid: access_token.uid) do |u|
      u.name = access_token.extra.raw_info.given_name
      u.password = SecureRandom.hex(12)
    end
    session[:user_id] = user.id

    # The following chunk of code is not utilized but has been retained in case TreeLogger ends up implementing utilization of the Google API
    # Access_token (defined in sessions/private) is used to authenticate requests made from the rails application to the google server
    user.google_token = access_token.credentials.token
    # Refresh_token to request new access_token
    # Note: Refresh_token is only sent once during the first request
    refresh_token = access_token.credentials.refresh_token
    user.google_refresh_token = refresh_token if refresh_token.present?
    user.save

    redirect_to root_path
  end

  def destroy
    reset_session
    @current_user = nil
    redirect_to root_path
  end

  private

  def access_token
    request.env["omniauth.auth"]
  end
end
