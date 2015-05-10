require 'rails_helper'

describe Rsvp do
  it "is valid with a user_id and party_id"
  it "is invalid without a user_id"
  it "is invalid without a party_id"
  it "is invalid if BOTH the user_id and party_id belong to an existing Rsvp"
end