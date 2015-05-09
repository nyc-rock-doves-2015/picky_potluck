5.times do
  party = Party.create(name: Faker::Company.name, date: Faker::Date.forward(20), location: 'Downtown, Manhattan')
  5.times do
    user = party.users.create(email: Faker::Internet.email, password: 'password', password_confirmation: 'password', name: Faker::Name.name, photo_url: Faker::Avatar.image, fave: 'lemon, pepper, onion, tomatoes')
  end
end

# 3 possible values for category:
    # ingredient (q= excludedIngredient[])
    # allergy (q= allowedAllergy[])
    # vegetarian (q= allowedDiet[])

  ALLERGIES = {
    dairy: "396%5EDairy-Free",
    egg: "397%5EEgg-Free",
    gluten: "393%5EGluten-Free",
    peanut: "394%5EPeanut-Free",
    seafood: "398%5ESeafood-Free",
    sesame: "399%5ESesame-Free",
    soy: "400%5ESoy-Free",
    sulfite: "401%5ESulfite-Free",
    tree_nut: "395%5ETree%20Nut-Free",
    wheat: "392%5EWheat-Free"
  }

  VEG_OPTIONS = {
    lacto_veg: "388%5ELacto%20vegetarian",
    ovo_veg: "389%5EOvo%20vegetarian",
    pescetarian: "390%5EPescetarian",
    vegan: "386%5EVegan",
    vegetarian: "387%5ELacto-ovo%20vegetarian",
    paleo: "403%5EPaleo"
  }

  ALLERGIES.each do |k, v|
    nono = Nono.create(name: k, category: "allergy", yummly_code: v)
    user = User.find(rand(25)+1)
    user.nonos << nono
  end

  VEG_OPTIONS.each do |k, v|
    nono = Nono.create(name: k, category: "vegetarian", yummly_code: v)
    user = User.find(rand(25)+1)
    user.nonos << nono
  end