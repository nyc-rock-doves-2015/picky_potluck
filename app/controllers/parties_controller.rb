class PartiesController < ApplicationController
  def show
    @party = Party.find(params[:id])
    @upcoming_parties = current_user.upcoming_parties
    @past_parties = current_user.past_parties
    if current_user.on_guest_list?(@party)
      @rsvp = Rsvp.new
      @location_query = @party.location.split(' ').join('+')
      @attendees = @party.users.order(:name)
      ues = UnregisteredEmail.where(party_id: params[:id])
      ues.each {|ue| @attendees << ue} if ues
      @restrictions = @party.combine_nonos
    else
      flash[:notice] = "Permission denied."
      redirect_to user_path(current_user)
    end
  end

  def create
    party = current_user.parties.create(party_params)
    rsvp = Rsvp.new
    redirect_to new_party_rsvp_path(party, rsvp)
  end

  def new
    @party = Party.new
    @upcoming_parties = current_user.upcoming_parties
    @past_parties = current_user.past_parties
  end

  def query_results
    @party = Party.find(params[:id])
    combined_nonos = @party.combine_nonos
    food = params[:query]
    api_caller = ApiCaller.new
    response_hash = api_caller.request(combined_nonos, food)
    @available_recipes = response_hash["matches"]
    @html = response_hash["attribution"]["html"]
    @claimed_dish = ClaimedDish.new
  end

  private

  def party_params
    params.require(:party).permit(:name, :location, :date)
  end


end