class PartiesController < ApplicationController
  def show
    @party = Party.find(params[:id])
    current_user_guest_list_check(@party)
    @rsvp = Rsvp.new
    @location_query = @party.location.split(' ').join('+')
    @attendees = @party.users
    @restrictions = @party.combine_nonos     
  end

  def create
    @party = current_user.parties.create(party_params)
    redirect_to party_path(@party)
  end

  def new
    @party = Party.new
  end

  def query_form
    @party = Party.find(params[:id])
  end

  def query_results
    @party = Party.find(params[:id])
    combined_nonos = @party.combine_nonos
    food = params[:query]
    api_caller = ApiCaller.new
    response_hash = api_caller.request(combined_nonos, food)
    @available_recipes = response_hash['matches']
    @claimed_dish = ClaimedDish.new
  end

  private

  def party_params
    params.require(:party).permit(:name, :location, :date)
  end

  def current_user_guest_list_check(party)
    if !current_user.on_guest_list?(party)
     flash[:notice] = "Sorry, you don't have permission to see that."
      redirect_to user_path(current_user)
    end
  end

end