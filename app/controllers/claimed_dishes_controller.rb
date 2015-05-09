class ClaimedDishesController < ApplicationController
  def create
    party = Party.find(params[:party_id])
    rsvp = party.rsvps.find_by(user_id: current_user.id)
    photo_url = params[:photo_url]
    photo_url = nil if photo_url == ""
    ClaimedDish.create(rsvp_id: rsvp.id, yummly_id: params[:claimed_dish][:yummly_id], photo_url: photo_url)
    redirect_to party_path(party)
  end
end