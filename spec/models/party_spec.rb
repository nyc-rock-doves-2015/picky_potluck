require 'rails_helper'

describe Party do

  let(:party) { FactoryGirl.build :party }

  context "validations" do
    it "should have a name and location" do
      expect(party.name).to eq "My Birthday"
      expect(party.location).to eq "New York"
    end

  end
end