## REAL DATA

INGREDIENTS = {
  "apple" => "applesauce,apple%20juice,apple%20pie%20filling",
  "apricot" => "apricot%20preserves",
  "banana" => "dried%20banana",
  "cherry" => "cherry%20juice,cherry%20syrup",
  "grape" => "grape%20juice",
  "kiwi" => "kiwi%20juice,kiwi%20fruits,kiwi%20fruit",
  "mango" => "mango%20juice,mango%20nectar,mango%20salsa",
  "melon" => "midori",
  "orange" => "orange%20juice,mandarin%20orange,orange%20flower%20water,blood%20orange%20juice,blood%20orange",
  "peach" => "peach%20juice,peach%20nectar,peach%20preserves",
  "pear" => "pear%20juice,pear%20nectar,pear%20preserves",
  "pineapple" => "pineapple%20juice,pineapple%20juice%20concentrate",
  "strawberry" => "strawberry%20jam,strawberry%20jelly"
}

#separate related foods by commas
ALLERGIES = {
  "Dairy" => ["396%5EDairy-Free"],
  "Eggs" => ["397%5EEgg-Free"],
  "Gluten" => ["393%5EGluten-Free"],
  "Peanuts" => ["394%5EPeanut-Free"],
  "Seafood" => ["398%5ESeafood-Free"],
  "Sesame" => ["399%5ESesame-Free", "tahini"],
  "Soy" => ["400%5ESoy-Free", "miso"],
  "Sulfites" => ["401%5ESulfite-Free"],
  "Tree Nuts" => ["395%5ETree%20Nut-Free"],
  "Wheat" => ["392%5EWheat-Free"]
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


10.times do
  User.create(email: TubularFaker.email, password: 'password', password_confirmation: 'password', name: TubularFaker.name, photo_url: Faker::Avatar.image, fave: "#{faves.sample}, #{faves.sample}, #{faves.sample}")
end

users = User.all

users_array = users.shuffle

2.times do
  index = 0
  users_array = users_array.shuffle
  2.times do
    party = Party.create(name: party_names.sample, date: Faker::Date.forward(20), location: '48 Wall Street, New York, NY')
    5.times do
      party.users << users_array[index]
      index += 1
    end
  end
end

2.times do
  index = 0
  users_array = users_array.shuffle
  2.times do
    party = Party.create(name: party_names.sample, date: Faker::Date.backward(20), location: '48 Wall Street, New York, NY')
    5.times do
      party.users << users_array[index]
      index += 1
    end
  end
end

## NONO CREATION & ASSIGNMENT

ALLERGIES.each do |k, v|
  nono = Nono.create(name: k, category: "allergy", yummly_code: v[0], related_foods: v[1])
  user = User.find_by(id: rand(20)+1)
  if user
    user.nonos << nono
  end
end

VEG_OPTIONS.each do |k, v|
  nono = Nono.create(name: k, category: "vegetarian", yummly_code: v)
  user = User.find_by(id: rand(20)+1)
  if user
    user.nonos << nono
  end
end

INGREDIENTS.each do |k, v|
  nono = Nono.create(name: k, category: "ingredient", related_foods: v)
end