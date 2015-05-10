require 'rails_helper'

feature "User can signin" do 
  let!(:user) { FactoryGirl.create :user }
  it "should be able to fill out a signin form and signin to the website" do
    visit enter_path
    fill_in 'session_email',   with: user.email
    fill_in 'session_password', with: user.password
    click_button "Sign In"
    expect(page).to have_content user.name
  end

end