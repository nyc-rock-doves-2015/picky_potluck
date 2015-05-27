class SessionsController < ApplicationController
  skip_before_action :gate_keeper

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome"
      redirect_to user_path(user)
    else
      flash[:error] = "Invalid email and/or password"
      redirect_to enter_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

end