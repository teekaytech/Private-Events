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
      session[:current_user_id] = @user.id
      redirect_to root_url, notice: 'Logged in!'
    else
      render :new
    end
  end

  def show
    @user = User.includes(:created_events).find(params[:id])
    current_user = @user.attended_events
    @past_events = current_user.previous_events
    @upcoming_events = current_user.upcoming_events
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
      redirect_to user_path(@user)
    end
  end

  def destroy
    @_current_user = session[:current_user_id] = nil
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit([:username, :email, :id])
  end
end
