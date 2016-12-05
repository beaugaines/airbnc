u = User.create(
  first_name: 'Bob',
  last_name: 'Smith',
  email: 'bob@hotmail.com',
  password: 'password'
)

10.times do
  Room.create(
    user: u,
    title: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph,
    city: Faker::Address.city,
    country: Faker::Address.country
  )
end
