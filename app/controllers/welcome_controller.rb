class WelcomeController < ApplicationController

  def auth
    @user = User.new
  end

end