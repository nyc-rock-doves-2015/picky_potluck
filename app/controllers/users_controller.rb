class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = Users.find(params[:id])
  end
end