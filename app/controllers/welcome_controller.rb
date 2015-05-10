class WelcomeController < ApplicationController

  skip_before_action :gate_keeper

  def auth
    if current_user
      redirect_to user_path(current_user)
    else
      @user = User.new
    end
  end

end