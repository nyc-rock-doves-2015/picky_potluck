require 'rails_helper'

describe Nono do
  it "is valid with a name and category of 'allergy', 'vegetarian', or 'ingredient'" do
    nono = Nono.new(
      name: Faker::Name.name,
      category: 'allergy')
    expect(nono).to be_valid

    nono = Nono.new(
      name: Faker::Name.name,
      category: 'vegetarian')
    expect(nono).to be_valid

    nono = Nono.new(
      name: Faker::Name.name,
      category: 'ingredient')
    expect(nono).to be_valid
  end

  it "is invalid without a name" do
    nono = Nono.new(name: nil)
    nono.valid?
    expect(nono.errors[:name]).to include("can't be blank")
  end

  it "is invalid without a category"
  it "is invalid if the category is something other than 'allergy', 'vegetarian', or 'ingredient'"
  it "is invalid without a yummly_code if the category is 'allergy'"
  it "is invalid without a yummly_code if the category is 'vegetarian'"
  it "returns a yummly_code as a string"
end