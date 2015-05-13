require 'rails_helper'

feature "User trying to sign up for the website" do
  let!(:user) { FactoryGirl.create :user }
  it "should be able to fill out a signup form with correct email, name, password and password_confirmation and be redirected to their homepage" do
    visit enter_path
      fill_in 'user_email',   with: "email@email.com"
      fill_in 'user_name',   with: "name"
      fill_in 'user_password', with: "password"
      fill_in 'user_password_confirmation', with: "password"
      expect{click_button "Create Account!"}.to change(User, :count).by(1)
    expect(page).to have_content "Name"
  end

  it "should not let a user signup with invalid email" do
    visit enter_path
      fill_in 'user_email',   with: "email"
      fill_in 'user_name',   with: "name"
      fill_in 'user_password', with: "password"
      fill_in 'user_password_confirmation', with: "password"
      expect{click_button "Create Account!"}.to change(User, :count).by(0)
    expect(page).to have_content "Sign Up"
  end
end