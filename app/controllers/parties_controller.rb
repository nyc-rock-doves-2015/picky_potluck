class PartiesController < ApplicationController
  def show
    @party = Party.find(params[:id])
  end

  def create

  end

  def new

  end
end