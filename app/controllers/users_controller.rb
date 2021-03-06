class UsersController < ApplicationController
  before_action :authenticate_user, except: %i[login new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:current_user_id] = @user.id
      redirect_to root_path, notice: 'Logged in!'
    else
      render :new
    end
  end

  def show
    @user_created_events = current_user.created_events
    @past_events = current_user.attended_events.previous_events
    @upcoming_events = current_user.attended_events.upcoming_events
  end

  def login; end

  def destroy
    @_current_user = session[:current_user_id] = nil
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit(%i[username email id])
  end
end
