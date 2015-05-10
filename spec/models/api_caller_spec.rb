require 'rails_helper'

describe ApiCaller do
  let(:allergy_nono) { Nono.new(
      name: Faker::Name.name,
      category: 'allergy',
      yummly_code: Faker::Address.longitude) }
  let(:veg_nono) { Nono.new(
      name: Faker::Name.name,
      category: 'vegetarian',
      yummly_code: Faker::Address.longitude) }
  let(:ingr_nono) { Nono.new(
      name: Faker::Name.name,
      category: 'ingredient',
      yummly_code: Faker::Address.longitude) }

  it "changes spaces to + in the input search term and includes that version in the query" do
    api_caller = ApiCaller.new
    # query = api_caller.generate_query()
  end
  it "adds parameters for ingredients after the ingredients query method"
  it "adds parameters for vegetarian options after the vegetarian options query method"
  it "adds parameters for allergies after the allergies query method"
end