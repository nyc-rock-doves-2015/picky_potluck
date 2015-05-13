class UsersController < ApplicationController
  skip_before_action :gate_keeper, only: [:create]

  def show
    @user = User.find(params[:id])
    @user_nonos = @user.nonos.map {|nono| nono.name }.join(", ")
    @upcoming_parties = @user.upcoming_parties
    @past_parties = @user.past_parties.last(3)
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id

      ue = UnregisteredEmail.find_by(name: user_params[:email])
      if ue
        user.rsvps.create(party_id: ue.party_id)
        ue.destroy
      end

      flash[:notice] = "Welcome"
      redirect_to edit_user_path(user)
    else
      flash[:notice] = user.errors.full_messages.join(". ")
      redirect_to enter_path
    end
  end

  def edit
    @user = User.find(params[:id])
    if is_current_user?(@user)
      @nonos = Nono.all
    else
      flash[:notice] = "You are not this user."
      redirect_to user_path(@user)
    end
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    user = User.find(params[:id])
    user.update_attributes(user_params)
    user.nono_users.destroy_all
    nonos_hash = params[:user][:restrictions]
    if nonos_hash
      nonos_hash.each_key do |key|
        user.nono_users.create(nono_id: key)
      end
    end
    redirect_to user_path(user)
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :photo_url, :fave)
  end

end