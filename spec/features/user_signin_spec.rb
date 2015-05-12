require 'rails_helper'

feature "User trying to sign into the website" do 
  let!(:user) { FactoryGirl.create :user }
  it "should be able to fill out a signin form with correct email and password and be redirected to their homepage" do
    visit enter_path
    fill_in 'session_email',   with: user.email
    fill_in 'session_password', with: user.password
    click_button "Sign In"
    expect(page).to have_content user.name
  end

  it "should be able to fill out a signin form with incorrect email and password and be redirected back to sign in page" do
    visit enter_path
    fill_in 'session_email',   with: "potato"
    fill_in 'session_password', with: "fussybuckets"
    click_button "Sign In"
    expect(page).to have_content "Sign In"
  end

  it "should be redirected to profile page if already signin" do
    page.set_rack_session(user_id: user.id)
    visit enter_path
    expect(page).to have_content user.name
  end
end