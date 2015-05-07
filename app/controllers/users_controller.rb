class UsersController < ApplicationController


  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    if !current_user
      @user = User.new
    else
      redirect_to root_url
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:notice] = "Thank you for signing up!"
      redirect_to root_url
    else
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :email, :photo_url, :fave)
  end

end