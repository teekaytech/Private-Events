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
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    # @user = User.find(user_params[:id])
  end

  private

  def user_params
    params.require(:user).permit([:username, :email])
  end
end
