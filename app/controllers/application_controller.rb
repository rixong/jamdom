class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :current_user
  before_action :require_logged_in, except: [:new, :create]

  def current_user
    @user = (User.find_by(id: session[:user_id]) || User.new)
  end

  def logged_in?
    current_user.id !=nil
  end

  def require_logged_in
    return redirect_to login_path unless logged_in?
  end

  helper_method :current_user, :logged_in?
  
end
