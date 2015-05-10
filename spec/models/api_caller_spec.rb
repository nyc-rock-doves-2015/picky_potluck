require 'rails_helper'

describe ApiCaller do
  let(:allergy_nono) { Nono.create(
      name: "beets",
      category: 'allergy',
      yummly_code: Faker::Address.longitude) }
  let(:veg_nono) { Nono.create(
      name: "veg",
      category: 'vegetarian',
      yummly_code: Faker::Address.longitude) }
  let(:ingr_nono) { Nono.create(
      name: "nuts",
      category: 'ingredient',
      yummly_code: Faker::Address.longitude) }
  let(:api_caller) {
    ApiCaller.new
  }
  let(:query) {
    api_caller.generate_query([allergy_nono, veg_nono, ingr_nono], "onion soup")
  }

  it "changes spaces to + in the input search term and includes that version in the query" do
    expect(query).to start_with("&q=onion+soup")
  end

  it "adds parameters for ingredients after the ingredients query method" do
    split_query = query.split("soup")
    expect(split_query[1]).to start_with("&excludedIngredient[]=nuts")
  end

  it "adds parameters for vegetarian options after the vegetarian options query method" do
    split_query = query.split("&allowedDiet")
  end


  it "adds parameters for allergies after the allergies query method"
end