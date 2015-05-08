class PartiesController < ApplicationController
  def show
    @party = Party.find(params[:id])
  end

  def create
    @party = Party.create(party_params)
    redirect_to party_path(@party)
  end

  def new
    @party = Party.new
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