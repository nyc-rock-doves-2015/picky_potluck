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
  it "is invalid if BOTH the user_id and party_id belong to an existing Rsvp" do
    user_id = rand(100) + 1
    party_id = rand(100) + 1
    rsvp1 = Rsvp.create(user_id: user_id, party_id: party_id)
    rsvp2 = Rsvp.new(user_id: user_id, party_id: party_id)
    expect(rsvp2.id).to be_nil
  end
end