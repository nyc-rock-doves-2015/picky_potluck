class ClaimedDishesController < ApplicationController

  def create
    party = Party.find(params[:party_id])
    rsvp = party.rsvps.find_by(user_id: current_user.id)
    rsvp.claimed_dishes.create(claimed_dish_params)
    redirect_to party_path(party)
  end

  private

  def claimed_dish_params
    params.require(:claimed_dish).permit(:yummly_id, :photo_url, :name, :rsvp_id)
  end

end