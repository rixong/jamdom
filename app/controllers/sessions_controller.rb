class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:user][:email])
    user = user.try(:authenticate, params[:user][:password])
    if user
      session[:user_id] = user.id
      redirect_to user_path(session[:user_id]) 
    else
      flash[:alert] = 'Invalid email/password combination. Try again.'
      redirect_to login_path
    end
  end


    # else redirect_to log_in_path, notice: "Sign up Success"
    # byebug


  def destroy
    # byebug
    session.delete :user_id
    redirect_to login_path
  end
  
end
