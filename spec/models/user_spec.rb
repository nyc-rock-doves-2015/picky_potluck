require 'rails_helper'
describe User do
  let(:user) { FactoryGirl.build :user }

  it "should have an email, name and password" do
    expect(user.email).to eq "test@test.com"
    expect(user.name).to eq "testie"
    expect(user.password).to eq "password"
  end
end