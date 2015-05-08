class PartiesController < ApplicationController
  def show
    @party = Party.find(params[:id])
    @location_query = @party.location.split(' ').join('+')
    @attendees = @party.users
    @restrictions = @party.combine_nonos
  end

  def create
    @party = current_user.parties.create(party_params)
    redirect_to party_path(@party)
  end

  def new
    if current_user
      @party = Party.new
    else
      flash[:notice] = "You must be signed in to create a party!"
      redirect_to signin_path
    end
  end

  def invite
    # get input from email field in parties/_invitation_form.html.erb
    # split it by space and comma
    # send the email using the mailer in mailers/user_mailer.rb
  end

  private

  def party_params
    params.require(:party).permit(:name, :location, :date)
  end


end