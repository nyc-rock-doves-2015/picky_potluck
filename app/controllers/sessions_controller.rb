class SessionsController < ApplicationController

  def new
    if !current_user
      redirect_to root_url
    end
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in!"
      redirect_to root_url
    else
      flash[:notice] = "Invalid username or password"
      redirect_to root_url
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out!"
    redirect_to root_url
  end

end