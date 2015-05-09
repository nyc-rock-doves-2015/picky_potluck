require 'rails_helper'
describe User do
  let(:user) { FactoryGirl.build :user }

  it "should have an email, name and password" do
    expect(user.email).to eq "test@test.com"
    expect(user.name).to eq "testie"
    expect(user.password).to eq "password"
  end

  it "should save to the database with good attributes" do
    user.save
    expect(User.count).to eq(1)
  end

  it "shouldn't save without an email" do
    user = FactoryGirl.build(:user, email: nil)
    user.save
    expect(User.count).to eq(0)
  end

  it "shouldn't save with an invalid email" do
    user = FactoryGirl.build(:user, email: "shoepolish")
    user.save
    expect(User.count).to eq(0)
  end


  it "shouldn't save without a name" do
    user = FactoryGirl.build(:user, name: nil)
    user.save
    expect(User.count).to eq(0)
  end


end