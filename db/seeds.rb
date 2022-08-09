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

puts "destroying all restaurants..."
Restaurant.destroy_all

puts "destroying all users..."
User.destroy_all

puts "DB is now clean!"

puts "creating 50 users and restaurants..."

50.times do
  Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_name,
    category: Faker::Restaurant.type,
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

puts "DONE! You now have 50 Users and 50 Restaurants in the DB..."
