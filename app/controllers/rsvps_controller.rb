class RsvpsController < ApplicationController

  def create
    notice = ""
    good_emails = []
    bad_emails = []
    party = Party.find(params[:party_id])
    email_addresses = params[:invitee_email_addresses][0].split(" ")
    email_addresses.each do |email_address|
      user = User.find_by(email: email_address)
      if user
        user.rsvps.create(party_id: party.id)
        good_emails << email_address
      else
        bad_emails << email_address
      end
    end
    notice += "Invitations sent to #{good_emails.join(' ')}. " if good_emails.length > 0
    notice += "Could not locate Picky Potluck members for #{bad_emails.join(', ')}. " if bad_emails.length > 0
    flash[:notice] = notice
    redirect_to party_path(party)
  end

end