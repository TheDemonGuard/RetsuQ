# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create 50 restaurants in DB
puts "cleaning the DB..."
puts ""

puts "destroying all queuers..."
Queuer.destroy_all

puts "destroying all restaurants..."
Restaurant.destroy_all

puts "destroying all users..."
User.destroy_all

puts "DB is now clean!"

puts "creating users and restaurants..."

addresses = [
  '1-4-9 Meguro, Meguro, Tokyo',
  '2-2-11 Shimomeguro, Meguro, Tokyo',
  '2-12-19 Yutenji, Meguro, Tokyo',
  '3-9-1 Meguro, Meguro, Tokyo',
  '3-9-3 Meguro, Meguro, Tokyo',
  '3-10-13 Meguro, Meguro, Tokyo',
  '1-23-14 Meguro, Meguro, Tokyo 153-0063, Japan',
  '2-11-8 Meguro, Meguro, Tokyo',
  '4-14-5 Meguro, Meguro, Tokyo 153-0063, Japan'
]

15.times do
  Restaurant.create!(
    name: Faker::Restaurant.name,
    address: addresses.sample,
    category: Faker::Restaurant.type,
    description: Faker::Restaurant.description,
    price_range: %w[$ $$ $$$ $$$$].sample,
    status: %w[open closed].sample,
    open_time: rand(9..11),
    close_time: rand(10..12),
    capacity: rand(20..50),
    total_wait_time: 0,
    time_per_person: 3,
    # creating a user for each restaurant
    user_id: User.create!(
      password: "123456",
      email: Faker::Internet.email
    ).id
  )
end

# seeds for the pitch
pitch_seed = Restaurant.create!(
  name: "The Gyoza Academy",
  address: "Shibuya",
  category: "Chinese",
  description: "The Gyoza Academy offers a wide range of varieties – prawn, chicken, beef, vegetables, pork – with an interesting array of toppings.",
  price_range: "$$",
  status: "open",
  open_time: rand(9..11),
  close_time: rand(10..12),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  # creating a user for each restaurant
  user_id: User.create!(
    password: "123456",
    email: "thegyozaacademy@real.com"
  ).id
)
# creating queuers
200.times do
  Queuer.create!(
    user_id: pitch_seed.user_id,
    restaurant_id: pitch_seed.user_id,
    size: rand(1..10),
    status: "completed",
    actual_wait_time: 0,
    created_at: (rand * 15).days.ago
  )
end

puts "DONE! You now have 15 Users and 15 Restaurants in the DB..."
