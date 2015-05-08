require 'rails_helper'
describe User do
  let(:user) { FactoryGirl.build :user }
  it "should have an email" do
    expect(user.email).to eq "test@test.com"
  end
end