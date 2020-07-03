class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:current_user_id] = user.id   
      redirect_to root_url, notice: 'Logged in!'   
    else
      render :new
    end
  end

  def show
    @user = User.find(session[:current_user_id])
  end

  def login
    
  end

  def authenticate
    @user = User.find_by(username: params[:username])
    if @user.nil?
      flash.notice = 'Username not found'
      render :login
    else
      session[:current_user_id] = @user.id
      flash.notice = 'Login successful'
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit([:username, :email, :id])
  end
end
