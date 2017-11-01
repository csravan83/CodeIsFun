class UsersController < ApplicationController
  before_action :authenticate_user!

  load_and_authorize_resource

  def index
    @users = User.all
  end

  def ban
    @user = User.find(params[:id])
    @user.toggle!(:banned)
    flash[:danger] = "User is banned"
    redirect_to root_path
  end

  def unban
    @user = User.find(params[:id])
    @user.toggle!(:banned)
    flash[:danger] = "User is Unbanned"
    redirect_to root_path
  end

  def show

  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
