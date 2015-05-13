## REAL DATA

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

## FAKE DATA


faves = [
"Steak",
"Chicken",
"Pizza",
"Waffles",
"Beef",
"Mozzarella Cheese",
"Bacon",
"Corned Beef",
"Avocado",
"Pasta",
"Pineapple",
"Peanut Butter",
"Hamburgers",
"Sushi",
"Pancakes",
"Noodles",
"Chocolate",
"Blueberries",
"Salmon",
"Banana",
"Ice Cream",
"Ham",
"Oysters",
"Mashed potatoes",
"Soup",
"Asparagus",
"Donuts",
"Turkey",
"Grapes",
"Popcorn",
"Eggs",
"Watermelon",
"Tuna",
"Cheddar cheese",
"Prawns",
"Strawberries",
"Artichokes",
"Halibut",
"Almonds",
"Mango",
"Meatballs",
"Apples",
"Lamb",
"Mushrooms",
"Kimchi",
"Kale",
"Grits",
"Chocolate"]


party_names = ["#{TubularFaker.name}'s Birthday", "#{TubularFaker.name} and #{TubularFaker.name}'s Wedding", "#{TubularFaker.name}'s Housewarming Party", "#{TubularFaker.name}'s Beach Blowout", "#{TubularFaker.name}'s Graduation Bash", "#{TubularFaker.name}'s Going Away Party", "Welcome Home, #{TubularFaker.name}"]

#What do you want?


#1. A bunch of parties, some in the past, some in the future each with 5 people attending.

#2. A bunch of users, each with 2 parties in the past and 2 parties in the future


#What does that mean?


#--- We need to have 4 parties total and 10 users. 



5.times do
  User.create(email: TubularFaker.email, password: 'password', password_confirmation: 'password', name: TubularFaker.name, photo_url: Faker::Avatar.image, fave: "#{faves.sample}, #{faves.sample}, #{faves.sample}")
end

2.times do
  id = 1
  party = Party.create(name: party_names.sample, date: Faker::Date.forward(20), location: '48 Wall Street, New York, NY')
  5.times do
    party.users << User.find(id)
    id += 1
  end
end


2.times do
  id = 1
  party = Party.create(name: party_names.sample, date: Faker::Date.backward(20), location: '48 Wall Street, New York, NY')
  5.times do
    party.users << User.find(id)
    id += 1
  end
end


  


## NONO CREATION & ASSIGNMENT

ALLERGIES.each do |k, v|
  3.times do
    nono = Nono.create(name: k, category: "allergy", yummly_code: v)
    user = User.find_by(id: rand(25)+1)
    if user
      user.nonos << nono
    end
  end
end

VEG_OPTIONS.each do |k, v|
  nono = Nono.create(name: k, category: "vegetarian", yummly_code: v)
  user = User.find_by(id: rand(25)+1)
  if user
    user.nonos << nono
  end
end