class PartiesController < ApplicationController
  def show
    @party = Party.find(params[:id])
    @location_query = @party.location.split(' ').join('+')
    @attendees = @party.users
    all_restrictions = []
    @attendees.each do |attendee|
      attendee.nonos.each {|nono| all_restrictions << nono.name} if attendee.nonos
    end

    if all_restrictions.length > 1
      @restrictions = all_restrictions.uniq.sort{|a,b| a<=>b}.join(", ")
    elsif all_restrictions.length == 1
      @restrictions = all_restrictions[0]
    else
      @restrictions = "We are not picky eaters!"
    end
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

  private

  def party_params
    params.require(:party).permit(:name, :location, :date)
  end


end