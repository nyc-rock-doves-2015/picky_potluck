5.times do
  party = Party.create(name: Faker::Company.name, date: Faker::Date.forward(20), location: 'Downtown, Manhattan')
  5.times do
    user = party.users.create(email: Faker::Internet.email, password: 'password', password_confirmation: 'password', name: Faker::Name.name, photo_url: Faker::Avatar.image, fave: 'lemon, pepper, onion, tomatoes')
    3.times do
      nono = user.nonos.create(name: Faker::Hacker.noun)
    end
  end
end