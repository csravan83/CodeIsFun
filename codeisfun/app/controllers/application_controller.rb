class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: [:index]
  before_action :update_sanitized_params, if: :devise_controller?
  before_action :banned?
  before_action :set_paper_trail_whodunnit

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, :alert => exception.message
  end

  helper_method :current_users, :logged_in?
  def current_users
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end


  def update_sanitized_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password , :current_password, :avatar])
  end


  def banned?
    if current_user.present? && current_user.banned?
      sign_out current_user
      flash[:error] = "This account has been suspended due to some violations (contact admin)"
      root_path
    end
  end

end



