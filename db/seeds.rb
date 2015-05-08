10.times do
  user = User.create(email: Faker::Internet.email, password: 'password', password_confirmation: 'password', name: Faker::Name.name, photo_url: Faker::Avatar.image)
  3.times do
    party = user.parties.create(name: Faker::Company.name, date: Faker::Date.forward(20), location: 'Downtown, Manhattan')
  end
  3.times do
    nono = user.nonos.create(name: Faker::Hacker.noun)
  end

end
