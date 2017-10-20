class UsersController < ApplicationController
  before_action :set_user,only: [:edit,:update,:show]
  before_action :require_same_user, only: [:edit,:update, :destroy]
  before_action :require_admin, only: [:destroy]

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:danger] = "User and all articles have been deleted"
    redirect_to users_path
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if  current_user != @user and !current_user.admin?
      flash[:danger] = "You can only edit your own account"
      redirect_to root_path
    end
  end

  def require_admin
    if logged_in? and !current_user.admin?
      flash[:danger] = "only admins can perform that action"
      redirect_to root_path
    end
  end

end
