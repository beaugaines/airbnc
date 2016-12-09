
User.destroy_all
Room.destroy_all
Review.destroy_all

u = User.create(
 first_name: 'Joe',
 last_name: 'Smith',
 email: 'joe@hotmail.com',
 password: 'password'
)

5.times do
 User.create(
   first_name: Faker::Name.first_name,
   last_name: Faker::Name.last_name,
   email: Faker::Internet.email,
   password: Faker::Internet.password
 )
end

users = User.all

10.times do
 room = Room.create(
   user: users.sample,
   title: Faker::Lorem.sentence,
   description: Faker::Lorem.paragraph,
   city: Faker::Address.city,
   country: Faker::Address.country
 )

rand(3..8).times do
  room.reviews.create(
    user: users.sample,
    body: Faker::Lorem.paragraph 
  )
end
end
