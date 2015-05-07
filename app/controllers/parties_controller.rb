class PartiesController < ApplicationController
  def show
    @party = Party.find(params[:id])
  end

  def create

  end

  def new
    @party = Party.new
  end
end