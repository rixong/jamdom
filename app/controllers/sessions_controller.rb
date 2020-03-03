class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:user][:email])
    user = user.try(:authenticate, params[:user][:password])    
    return redirect_to login_path unless user
    session[:user_id] = user.id
    # byebug
    redirect_to user_path(session[:user_id])
  end

  def destroy
    # byebug
    session.delete :user_id
    redirect_to login_path
  end
  
end
