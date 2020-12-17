class UsersController < ApplicationController

  skip_before_action :authentication, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def show
    @user = User.find_by_id(params[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
