require 'rails_helper'

describe Nono do
  it "is valid with a name and category of 'allergy', 'vegetarian', or 'ingredient'" do
    nono = Nono.new(
      name: Faker::Name.name,
      category: 'allergy',
      yummly_code: Faker::Address.longitude)
    expect(nono).to be_valid

    nono = Nono.new(
      name: Faker::Name.name,
      category: 'vegetarian',
      yummly_code: Faker::Address.longitude)
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

  it "is invalid without a category" do
    nono = Nono.new(category: nil)
    nono.valid?
    expect(nono.errors[:category]).to include("can't be blank")
  end

  it "is invalid if the category is something other than 'allergy', 'vegetarian', or 'ingredient'" do
    nono = Nono.new(category: Faker::Company.name)
    nono.valid?
    expect(nono.errors[:category]).to include("is not a valid category")
  end

  it "is invalid without a yummly_code if the category is 'allergy'" do
    nono = Nono.new(category: "allergy", yummly_code: nil)
    nono.valid?
    expect(nono.errors[:yummly_code]).to include("can't be blank")
  end

  it "is invalid without a yummly_code if the category is 'vegetarian'"
  it "returns a yummly_code as a string"

end