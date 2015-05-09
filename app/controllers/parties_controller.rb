class PartiesController < ApplicationController
  def show
    @rsvp = Rsvp.new
    @party = Party.find(params[:id])
    @location_query = @party.location.split(' ').join('+')
    @attendees = @party.users
    @restrictions = @party.combine_nonos
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

  def query_form

  end

  def query_results

  end

  private

  def party_params
    params.require(:party).permit(:name, :location, :date)
  end


end