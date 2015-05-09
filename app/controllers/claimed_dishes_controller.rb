class ClaimedDishesController < ApplicationController
  def create
    party = Party.find(params[:party_id])
    redirect_to party_path(party)
  end
end