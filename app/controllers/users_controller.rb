class UsersController < ApplicationController
  #before_action :require_logged_in
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to edit_user_path(@user)
    else
      @user.errors.full_messages
      # byebug
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end
 
  private
  def user_params
    params.require(:user).permit(:name, :email, :bio, {:genre_ids => []}, {:instrument_ids => []}, :password, :password_confirmation)
  end

end
