class UsersController < ApplicationController

  def initialize
    @restrictions = ['cow','dairy','egg','fish','milk','shellfish','soy','peanut','pork','poultry','wheat']
  end

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

  def edit
    # if current_user.id == params[:id]
      # @user = current_user
    # else
      # alert msg
    # end

    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    nonos_hash = params[:user][:restrictions]

    nonos_hash.each_key do |key|
      @user.nonos.find_or_create_by(name: key.downcase)
    end

    render 'show'
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :email, :photo_url, :fave)
  end

end