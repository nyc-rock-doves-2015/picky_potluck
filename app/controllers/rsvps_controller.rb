class RsvpsController < ApplicationController

  def edit
    @party = Party.find(params[:party_id])
    current_user_guest_list_check(@party)
    @rsvp = Rsvp.find(params[:id])
    if @rsvp.user_id != current_user.id
      flash[:notice] = "Sorry, you don't have permission to see that."
      redirect_to user_path(current_user)
    end
  end

  def update
    party = Party.find(params[:party_id])
    rsvp = Rsvp.find(params[:id])
    rsvp.update(status: params[:rsvp][:status])
    if request.xhr?
      render text: rsvp.status
    else
      redirect_to party_path(party)
    end
  end

  def create
    party = Party.find(params[:party_id])
    emails = params[:emails][0].split(" ")

    emails.each do |email|
      user = User.find_by(email: email)
      if user
        user.rsvps.create(party_id: party.id)
      else
        UnregisteredEmail.create(name: email, party_id: party.id)
      end
      UserMailer.invite_email(email, current_user, party).deliver
    end
    flash[:notice] = "Invitations successfully sent."
    redirect_to party_path(party)
  end

  def new
    @party = Party.find(params[:party_id])
    if @party.rsvps.length > 1 || UnregisteredEmail.find_by(party_id: @party.id)
      redirect_to party_path(@party)
    else
      @rsvp = Rsvp.new
    end
  end

end