class RsvpsController < ApplicationController

  def create
    good_emails = []
    bad_emails = []
    party = Party.find(params[:party_id])
    email_addresses = params[:emails][0].split(" ")
    email_addresses.each do |email_address|
      user = User.find_by(email: email_address)
      if user
        user.rsvps.create(party_id: party.id)
        good_emails << email_address
      else
        bad_emails << email_address
      end
    end
    flash[:notice] = create_notice(good_emails, bad_emails)
    redirect_to party_path(party)
  end

  private

  def create_notice(good_emails, bad_emails)
    notice = ""
    notice += "Invitations sent to #{good_emails.join(' ')}. " if good_emails.length > 0
    notice += "Could not locate Picky Potluck memberships for #{bad_emails.join(', ')}. " if bad_emails.length > 0
    notice
  end

end