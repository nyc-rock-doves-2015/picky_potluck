require 'rails_helper'

describe Rsvp do
  it "is valid with a user_id and party_id" do
    rsvp = Rsvp.new(user_id: Faker::Address.building_number, party_id: Faker::Address.building_number)
    expect(rsvp).to be_valid
  end
  it "is invalid without a user_id" do
    rsvp = Rsvp.new(user_id: nil)
    rsvp.valid?
    expect(rsvp.errors[:user_id]).to include("can't be blank")
  end
  it "is invalid without a party_id" do
    rsvp = Rsvp.new(party_id: nil)
    rsvp.valid?
    expect(rsvp.errors[:party_id]).to include("can't be blank")
  end
  it "is invalid if BOTH the user_id and party_id belong to an existing Rsvp"
end