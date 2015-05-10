class UsersController < ApplicationController
  skip_before_action :gate_keeper, only: [:create]

  def show
    @user = User.find(params[:id])
    parties = @user.parties
    @upcoming_parties = []
    @past_parties = []
    parties.each do |party|
      if party.upcoming?
        @upcoming_parties << party
      else
        @past_parties << party
      end
    end
    @past_parties = @past_parties.last(3)
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:notice] = "Thank you for signing up!"
      redirect_to user_path(user)
    else
      flash[:notice] = "Sorry, we could not create your account. Please try again."
      redirect_to enter_path
    end
  end

  def edit
    user = User.find(params[:id])
    if current_user == user
      @user = current_user
    else
      flash[:notice] = "You are not this user."
      redirect_to user_path(user)
    end
    @nonos = Nono.all
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    fave = user_params[:fave]
    @user.update_attributes(fave: fave)

    @user.nono_users.destroy_all

    nonos_hash = params[:user][:restrictions]
    if nonos_hash
      nonos_hash.each_key do |key|
        @user.nono_users.create(nono_id: key)
      end
    end

    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :photo_url, :fave)
  end

end