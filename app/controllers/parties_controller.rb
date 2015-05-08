class PartiesController < ApplicationController
  def show
    @party = Party.find(params[:id])
    @attendees = @party.users
    all_restrictions = []
    @attendees.each do |attendee|
      attendee.nonos.each do |nono|
        all_restrictions << nono.name
      end
    end
    @restrictions = all_restrictions.uniq!.sort{|a,b| a<=>b}.split('').join(", ")
  end

  def create
    @party = Party.create(party_params)
    redirect_to party_path(@party)
  end

  def new
    @party = Party.new
  end

  private

  def party_params
    params.require(:party).permit(:name, :location, :date)
  end


end