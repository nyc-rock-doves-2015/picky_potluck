class PartiesController < ApplicationController
  def show
    @party = Party.find(params[:id])
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