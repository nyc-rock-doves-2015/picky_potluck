class ClaimedDishesController < ApplicationController
  def create
    party = Party.find(params[:party_id])
    rsvp = party.rsvps.find_by(user_id: current_user.id)
    p "HERE ARE THE PARAMS!!!!!!!!!"
    p params
    # rsvp.claimed_dish.create()
    redirect_to party_path(party)
  end
end