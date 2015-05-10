require 'rails_helper'

feature "User trying to sign out of the website" do 
  let!(:user) { FactoryGirl.create :user }
  it "should be able to signout do" do 
    page.set_rack_session(user_id: user.id)
    visit enter_path
    click_link "Sign Out"
    expect(page).to have_content "Picky Potluck"
    expect(page).to have_button "Enter"
  end
end