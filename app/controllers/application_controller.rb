class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :gate_keeper

  helper_method :current_user

  def current_user
    User.find_by(id: session[:user_id])
  end

  def gate_keeper
    if !current_user
      flash[:notice] = "Please sign in to view that."
      redirect_to enter_path
    end
  end

  def current_user_guest_list_check(party)
    if !current_user.on_guest_list?(party)
     flash[:notice] = "Sorry, you don't have permission to see that."
      redirect_to user_path(current_user)
    end
  end


end
