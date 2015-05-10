require 'rails_helper'

describe Nono do
  it "is valid with a name and category of 'allergy', 'vegetarian', or 'ingredient'"
  it "is invalid without a name"
  it "is invalid without a category"
  it "is invalid if the category is something other than 'allergy', 'vegetarian', or 'ingredient'"
  it "is invalid without a yummly_code if the category is 'allergy'"
  it "is invalid without a yummly_code if the category is 'vegetarian'"
  it "returns a yummly_code as a string"
end