class PartiesController < ApplicationController
  def show
    @party = Party.find(params[:id])
  end

  def create
    Party.new(params[:party])
  end

  def new
    @party = Party.new
  end

  private


end