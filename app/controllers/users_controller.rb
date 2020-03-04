class UsersController < ApplicationController
  #before_action :require_logged_in
  
  def index
    @users = User.all
  end

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
    link = parse_youtube(params[:user][:video])
    @user.update(video: link) if link
    redirect_to user_path(@user)
  end

  def instrument_search
    redirect_to results_path(params[:instrument_ids])
  end
  
  def instrument_results
    @users = User.instrument_search(params[:id])

  end
 
  private
    def user_params
      params.require(:user).permit(:name, :email, :phone, :bio, {:genre_ids => []}, {:instrument_ids => []}, :password, :password_confirmation)
    end

    def parse_youtube(link)
      if link.include?("https://youtu.be/")
        link.gsub!("https://youtu.be/", "")
        full_link = "https://www.youtube.com/embed/#{link}"
      else
        nil
      end
    end

end
