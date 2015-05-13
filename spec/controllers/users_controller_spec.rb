require 'rails_helper'

describe UsersController do

  describe 'GET #show' do
    it "assigns the requested user to @user"
    it "assigns the requested user's upcoming parties to @upcoming_parties"
    it "assigns the requested user's nonos to @nonos"
    it "assigns the requested user's past parties to @past_parties"
    it "renders the :show template"
  end

  describe 'GET #edit' do
    it "assigns the current user to @user if the current user is trying to edit their own profile"
    it "redirects to the current user's profile page if they are trying to edit someone else's profile"
    it "renders the :edit template"
  end

  describe 'POST #create' do

  end

  describe 'POST #update' do

  end

end