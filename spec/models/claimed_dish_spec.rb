require 'rails_helper'

describe ClaimedDish do

  it "is valid with a yummly_id and rsvp_id" do
    dish = ClaimedDish.new(yummly_id: Faker::Address.zip, rsvp_id: Faker::Address.zip)
    expect(dish).to be_valid
  end

  it "is invalid without a yummly_id" do
    dish = ClaimedDish.new(yummly_id: nil)
    dish.valid?
    expect(dish.errors[:yummly_id]).to include("can't be blank")
  end

  it "is invalid without a rsvp_id" do
    dish = ClaimedDish.new(rsvp_id: nil)
    dish.valid?
    expect(dish.errors[:rsvp_id]).to include("can't be blank")
  end

end