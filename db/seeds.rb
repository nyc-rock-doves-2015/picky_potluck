Party.create(name: "Beccy's Birthday", date: Faker::Date.forward(20), location: '48 Wall Street, New York, NY')

Party.create(name: "Our Anniversary", date: Faker::Date.forward(20), location: '48 Wall Street, New York, NY')

Party.create(name: "Graduation Party!", date: Faker::Date.forward(20), location: '48 Wall Street, New York, NY')


Party.create(name: "Summer BBQ", date: Faker::Date.forward(20), location: '48 Wall Street, New York, NY')

Party.create(name: "Graduation Bash", date: Faker::Date.forward(20), location: '48 Wall Street, New York, NY')

Party.create(name: "Juan's going away party", date: Faker::Date.forward(20), location: '48 Wall Street, New York, NY')

Party.create(name: "Welcome Home, Denise!", date: Faker::Date.forward(20), location: '48 Wall Street, New York, NY')


faves = ["chocolate", "shrimp", "onion soup", "chicken pot pie", "olives", "kimchi", "strawberries", "sushi", "collard greens", "egg salad", "mustard", "sausage", "refried beans", "caesar salad", "grits", "macaroni and cheese", "latkes"]

Party.all.each do |party|
    5.times do
    user = party.users.create(email: Faker::Internet.email, password: 'password', password_confirmation: 'password', name: Faker::Name.name, photo_url: Faker::Avatar.image, fave: faves.sample)
  end
end

# 3 possible values for category:
    # ingredient (q= excludedIngredient[])
    # allergy (q= allowedAllergy[])
    # vegetarian (q= allowedDiet[])

  ALLERGIES = {
    "Dairy" => "396%5EDairy-Free",
    "Eggs" => "397%5EEgg-Free",
    "Gluten" => "393%5EGluten-Free",
    "Peanuts" => "394%5EPeanut-Free",
    "Seafood" => "398%5ESeafood-Free",
    "Sesame" => "399%5ESesame-Free",
    "Soy" => "400%5ESoy-Free",
    "Sulfites" => "401%5ESulfite-Free",
    "Tree Nuts" => "395%5ETree%20Nut-Free",
    "Wheat" => "392%5EWheat-Free"
  }

  VEG_OPTIONS = {
    "Lacto Vegetarian" => "388%5ELacto%20vegetarian",
    "Ovo Vegetarian" => "389%5EOvo%20vegetarian",
    "Pescetarian" => "390%5EPescetarian",
    "Vegan" => "386%5EVegan",
    "Vegetarian" => "387%5ELacto-ovo%20vegetarian",
    "Paleo" => "403%5EPaleo"
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