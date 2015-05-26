require 'rails_helper'

describe Party do

  let(:party) { FactoryGirl.build :party }

  context "validations" do
    it "should have a name and location" do
      expect(party.name).to eq "My Birthday"
      expect(party.location).to eq "New York"
    end

    it "should save to the database with good attributes" do
      party.save
      expect(Party.count).to eq(1)
    end

    it "shouldn't save to the database without a name" do
      party = FactoryGirl.build(:party, name: nil)
        party.save
        expect(Party.count).to eq(0)
    end

    it "should have no combined_nonos with no users" do
      expect(party.combine_nonos.empty?).to eq true
    end

  end
end