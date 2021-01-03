class UsersController < ApplicationController

  skip_before_action :authentication, only: [:new, :create]
  helper_method :greet
  
  def new
    @user = User.new
    @errors = @user.errors
  end

  def create
    @user = User.new(user_params)
    @errors = @user.errors
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def show
  end

  def edit
  end

  def update
  end

  def delete_user_confirmation
  end

  def destroy
    current_user.delete
    byebug
    redirect_to root_path
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

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
