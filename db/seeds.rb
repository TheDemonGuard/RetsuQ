# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create 50 restaurants in DB
require "open-uri"

puts "cleaning the DB..."
puts ""

puts "destroying all queuers..."
Queuer.destroy_all

puts "destroying all restaurants..."
Restaurant.destroy_all

puts "destroying all users..."
User.destroy_all

puts "DB is now clean!"

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

photos1 = URI.open("https://images.unsplash.com/photo-1607083966193-2215b910f372?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
photos2 = URI.open("https://images.unsplash.com/photo-1627299632191-30b0e4b251da?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80")
photos3 = URI.open("https://images.unsplash.com/photo-1598053956766-5ac9929bc979?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80")
photos4 = URI.open("https://images.unsplash.com/photo-1570345302822-83ac4c39fbae?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1632&q=80")
photos5 = URI.open("https://images.unsplash.com/photo-1593676867590-59e0a8b37b54?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1474&q=80")
photos6 = URI.open("https://images.unsplash.com/photo-1480796927426-f609979314bd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
photos7 = URI.open("https://images.unsplash.com/photo-1566204978576-77f6addcef4d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
photos8 = URI.open("https://images.unsplash.com/photo-1582816913830-ccc1b1945922?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80")
photos9 = URI.open("https://images.unsplash.com/photo-1579764578151-25a817b0bf06?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80")
photos10 = URI.open("https://images.unsplash.com/photo-1573416264252-834d212583ab?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80")
photos11 = URI.open("https://images.unsplash.com/photo-1536523218403-e72792eb06a1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
photos12 = URI.open("https://images.unsplash.com/photo-1545830016-67f0142f9652?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
photos13 = URI.open("https://images.unsplash.com/photo-1568018508399-e53bc8babdde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2948&q=80")
photos14 = URI.open("https://images.unsplash.com/photo-1514933651103-005eec06c04b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80")
photos15 = URI.open("https://images.unsplash.com/photo-1543007631-283050bb3e8c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80")
photos16 = URI.open("https://images.unsplash.com/photo-1591261730799-ee4e6c2d16d7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
photos17 = URI.open("https://images.unsplash.com/photo-1533089624661-8da26146e8de?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80")
photos18 = URI.open("https://images.unsplash.com/photo-1588110919463-73dfc27cacf6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80")
photos19 = URI.open("https://images.unsplash.com/photo-1640282095057-805fc933681a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1398&q=80")
photos20 = URI.open("https://images.unsplash.com/photo-1588960546673-192261e93146?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80")
photos21 = URI.open("https://images.unsplash.com/photo-1543373072-69f3d4788832?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
photos22 = URI.open("https://images.unsplash.com/photo-1623156346149-d5cec8b29818?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1631&q=80")
photos23 = URI.open("https://images.unsplash.com/photo-1541686242972-cde41c4fd17d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1425&q=80")
photos24 = URI.open("https://images.unsplash.com/photo-1519167874178-f1c834c38f25?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
photos25 = URI.open("https://images.unsplash.com/photo-1542039778-22c80bfeaa48?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80")
photos26 = URI.open("https://images.unsplash.com/photo-1648949300258-0867ac9980a7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1375&q=80")
photos27 = URI.open("https://images.unsplash.com/photo-1583779791512-eeccdee5c5dd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
photos28 = URI.open("https://images.unsplash.com/photo-1531664958159-87676e2770a8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
photos29 = URI.open("https://images.unsplash.com/photo-1604624483037-489d287ae9fd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1523&q=80")
photos30 = URI.open("https://images.unsplash.com/photo-1615897431041-5511a4e2e559?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
photos31 = URI.open("https://images.unsplash.com/photo-1617655699589-64375e5ad9a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80")
photos32 = URI.open("https://images.unsplash.com/photo-1565348323129-7f04169e2148?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=690&q=80")
photos34 = URI.open("https://images.unsplash.com/photo-1508955080361-a155a8773c13?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=733&q=80")
photos35 = URI.open("https://images.unsplash.com/photo-1414235077428-338989a2e8c0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
photos36 = URI.open("https://images.unsplash.com/photo-1555396273-367ea4eb4db5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80")
photos37 = URI.open("https://images.unsplash.com/photo-1424847651672-bf20a4b0982b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
photos38 = URI.open("https://images.unsplash.com/photo-1498654896293-37aacf113fd9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
photos39 = URI.open("https://images.unsplash.com/photo-1587574293340-e0011c4e8ecf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1632&q=80")
photos40 = URI.open("https://images.unsplash.com/photo-1485182708500-e8f1f318ba72?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1510&q=80")
photos41 = URI.open("https://images.unsplash.com/photo-1587899897387-091ebd01a6b2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1513&q=80")
photos42 = URI.open("https://images.unsplash.com/photo-1590577976322-3d2d6e2130d5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
photos43 = URI.open("https://images.unsplash.com/photo-1502998070258-dc1338445ac2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=679&q=80")
photos44 = URI.open("https://images.unsplash.com/photo-1515668236457-83c3b8764839?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80")
photos45 = URI.open("https://images.unsplash.com/photo-1484723091739-30a097e8f929?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=749&q=80")
photos46 = URI.open("https://images.unsplash.com/photo-1576829824883-bf9e6b522252?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80")
photos47 = URI.open("https://images.unsplash.com/photo-1565895405140-6b9830a88c19?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1471&q=80")
photos48 = URI.open("https://images.unsplash.com/photo-1512132411229-c30391241dd8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
photos49 = URI.open("https://images.unsplash.com/photo-1526318896980-cf78c088247c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80")
photos50 = URI.open("https://images.unsplash.com/photo-1569137735645-bfb33825333b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=736&q=80")
photos51 = URI.open("https://images.unsplash.com/photo-1562436356-11574662e477?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
photos52 = URI.open("https://images.unsplash.com/photo-1603894483390-dc12ecd2c9dd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=733&q=80")

require 'securerandom'
random_string = SecureRandom.hex

user1 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant1 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses.sample,
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Closed temporarily", "Closed entire day", "Closed outside business hours", "Open"].sample,
  open_time: rand(9..11),
  close_time: rand(10..12),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user1.id
)
restaurant1.photos.attach(io: photos1, filename: 'user.png', content_type: 'image/png')
restaurant1.photos.attach(io: photos2, filename: 'user.png', content_type: 'image/png')
restaurant1.photos.attach(io: photos31, filename: 'user.png', content_type: 'image/png')

user2 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant2 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses.sample,
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Closed temporarily", "Closed entire day", "Closed outside business hours", "Open"].sample,
  open_time: rand(9..11),
  close_time: rand(10..12),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user2.id
)
restaurant2.photos.attach(io: photos3, filename: 'user.png', content_type: 'image/png')
restaurant2.photos.attach(io: photos4, filename: 'user.png', content_type: 'image/png')
restaurant1.photos.attach(io: photos32, filename: 'user.png', content_type: 'image/png')

user3 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant3 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses.sample,
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Closed temporarily", "Closed entire day", "Closed outside business hours", "Open"].sample,
  open_time: rand(9..11),
  close_time: rand(10..12),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user3.id
)
restaurant3.photos.attach(io: photos5, filename: 'user.png', content_type: 'image/png')
restaurant3.photos.attach(io: photos6, filename: 'user.png', content_type: 'image/png')
restaurant1.photos.attach(io: photos46, filename: 'user.png', content_type: 'image/png')

user4 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant4 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses.sample,
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Closed temporarily", "Closed entire day", "Closed outside business hours", "Open"].sample,
  open_time: rand(9..11),
  close_time: rand(10..12),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user4.id
)
restaurant4.photos.attach(io: photos7, filename: 'user.png', content_type: 'image/png')
restaurant4.photos.attach(io: photos8, filename: 'user.png', content_type: 'image/png')
restaurant1.photos.attach(io: photos34, filename: 'user.png', content_type: 'image/png')

user5 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant5 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses.sample,
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Closed temporarily", "Closed entire day", "Closed outside business hours", "Open"].sample,
  open_time: rand(9..11),
  close_time: rand(10..12),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user5.id
)

restaurant5.photos.attach(io: photos9, filename: 'user.png', content_type: 'image/png')
restaurant5.photos.attach(io: photos10, filename: 'user.png', content_type: 'image/png')
restaurant1.photos.attach(io: photos35, filename: 'user.png', content_type: 'image/png')

user6 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant6 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses.sample,
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Closed temporarily", "Closed entire day", "Closed outside business hours", "Open"].sample,
  open_time: rand(9..11),
  close_time: rand(10..12),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user6.id
)
restaurant6.photos.attach(io: photos11, filename: 'user.png', content_type: 'image/png')
restaurant6.photos.attach(io: photos12, filename: 'user.png', content_type: 'image/png')
restaurant1.photos.attach(io: photos36, filename: 'user.png', content_type: 'image/png')

user7 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant7 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses.sample,
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Closed temporarily", "Closed entire day", "Closed outside business hours", "Open"].sample,
  open_time: rand(9..11),
  close_time: rand(10..12),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user7.id
)
restaurant7.photos.attach(io: photos13, filename: 'user.png', content_type: 'image/png')
restaurant7.photos.attach(io: photos14, filename: 'user.png', content_type: 'image/png')
restaurant1.photos.attach(io: photos37, filename: 'user.png', content_type: 'image/png')

user8 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant8 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses.sample,
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Closed temporarily", "Closed entire day", "Closed outside business hours", "Open"].sample,
  open_time: rand(9..11),
  close_time: rand(10..12),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user8.id
)
restaurant8.photos.attach(io: photos15, filename: 'user.png', content_type: 'image/png')
restaurant8.photos.attach(io: photos16, filename: 'user.png', content_type: 'image/png')
restaurant1.photos.attach(io: photos38, filename: 'user.png', content_type: 'image/png')

user9 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant9 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses.sample,
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Closed temporarily", "Closed entire day", "Closed outside business hours", "Open"].sample,
  open_time: rand(9..11),
  close_time: rand(10..12),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user9.id
)
restaurant9.photos.attach(io: photos17, filename: 'user.png', content_type: 'image/png')
restaurant9.photos.attach(io: photos18, filename: 'user.png', content_type: 'image/png')
restaurant1.photos.attach(io: photos39, filename: 'user.png', content_type: 'image/png')

user10 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant10 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses.sample,
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Closed temporarily", "Closed entire day", "Closed outside business hours", "Open"].sample,
  open_time: rand(9..11),
  close_time: rand(10..12),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user10.id
)
restaurant10.photos.attach(io: photos19, filename: 'user.png', content_type: 'image/png')
restaurant10.photos.attach(io: photos20, filename: 'user.png', content_type: 'image/png')
restaurant1.photos.attach(io: photos40, filename: 'user.png', content_type: 'image/png')

user11 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant11 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses.sample,
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Closed temporarily", "Closed entire day", "Closed outside business hours", "Open"].sample,
  open_time: rand(9..11),
  close_time: rand(10..12),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user11.id
)
restaurant11.photos.attach(io: photos21, filename: 'user.png', content_type: 'image/png')
restaurant11.photos.attach(io: photos22, filename: 'user.png', content_type: 'image/png')
restaurant11.photos.attach(io: photos41, filename: 'user.png', content_type: 'image/png')

user12 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant12 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses.sample,
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Closed temporarily", "Closed entire day", "Closed outside business hours", "Open"].sample,
  open_time: rand(9..11),
  close_time: rand(10..12),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user12.id
)
restaurant12.photos.attach(io: photos23, filename: 'user.png', content_type: 'image/png')
restaurant12.photos.attach(io: photos24, filename: 'user.png', content_type: 'image/png')
restaurant11.photos.attach(io: photos42, filename: 'user.png', content_type: 'image/png')

user13 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant13 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses.sample,
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Closed temporarily", "Closed entire day", "Closed outside business hours", "Open"].sample,
  open_time: rand(9..11),
  close_time: rand(10..12),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user13.id
)
restaurant13.photos.attach(io: photos25, filename: 'user.png', content_type: 'image/png')
restaurant13.photos.attach(io: photos26, filename: 'user.png', content_type: 'image/png')
restaurant11.photos.attach(io: photos43, filename: 'user.png', content_type: 'image/png')

user14 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant14 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses.sample,
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Closed temporarily", "Closed entire day", "Closed outside business hours", "Open"].sample,
  open_time: rand(9..11),
  close_time: rand(10..12),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user14.id
)
restaurant14.photos.attach(io: photos27, filename: 'user.png', content_type: 'image/png')
restaurant14.photos.attach(io: photos28, filename: 'user.png', content_type: 'image/png')
restaurant11.photos.attach(io: photos44, filename: 'user.png', content_type: 'image/png')

user15 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant15 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses.sample,
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Closed temporarily", "Closed entire day", "Closed outside business hours", "Open"].sample,
  open_time: rand(9..11),
  close_time: rand(10..12),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user15.id
)
restaurant15.photos.attach(io: photos29, filename: 'user.png', content_type: 'image/png')
restaurant15.photos.attach(io: photos30, filename: 'user.png', content_type: 'image/png')
restaurant11.photos.attach(io: photos45, filename: 'user.png', content_type: 'image/png')

# 1.times do
#   restaurant1.photos.attach(io: photos.sample, filename: random_string + ".png", content_type: 'image/png')
#   restaurant2.photos.attach(io: photos.sample, filename: random_string + ".png", content_type: 'image/png')
#   restaurant3.photos.attach(io: photos.sample, filename: random_string + ".png", content_type: 'image/png')
#   restaurant4.photos.attach(io: photos.sample, filename: random_string + ".png", content_type: 'image/png')
#   restaurant5.photos.attach(io: photos.sample, filename: random_string + ".png", content_type: 'image/png')
#   restaurant6.photos.attach(io: photos.sample, filename: random_string + ".png", content_type: 'image/png')
#   restaurant7.photos.attach(io: photos.sample, filename: random_string + ".png", content_type: 'image/png')
#   restaurant8.photos.attach(io: photos.sample, filename: random_string + ".png", content_type: 'image/png')
#   restaurant9.photos.attach(io: photos.sample, filename: random_string + ".png", content_type: 'image/png')
#   restaurant10.photos.attach(io: photos.sample, filename: random_string + ".png", content_type: 'image/png')
#   restaurant11.photos.attach(io: photos.sample, filename: random_string + ".png", content_type: 'image/png')
#   restaurant12.photos.attach(io: photos.sample, filename: random_string + ".png", content_type: 'image/png')
#   restaurant13.photos.attach(io: photos.sample, filename: random_string + ".png", content_type: 'image/png')
#   restaurant14.photos.attach(io: photos.sample, filename: random_string + ".png", content_type: 'image/png')
#   restaurant15.photos.attach(io: photos.sample, filename: random_string + ".png", content_type: 'image/png')
# end

pitch_owner = User.create!(
  password: "123456",
  email: "thegyozaacademy@real.com",
  role: "owner"
)

pitch_user = User.create!(
  password: "123456",
  email: "user@real.com",
  role: "user"
)

# Restaurant seed for the pitch
pitch_seed1 = Restaurant.create!(
  name: "The Gyoza Academy",
  address: "Shibuya",
  category: "Chinese",
  description: "The Gyoza Academy offers a wide range of varieties – prawn, chicken, beef, vegetables, pork – with an interesting array of toppings.",
  price_range: "$$",
  status: "Open",
  open_time: rand(9..11),
  close_time: rand(10..12),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  # creating a user for each restaurant
  user: pitch_owner
)

pitch_seed2 = Restaurant.create!(
  name: "Bamboo Gyoza",
  address: "Shibuya",
  category: "Chinese",
  description: "The Bamboo Gyoza offers a wide range of varieties – prawn, chicken, beef, vegetables, pork – with an interesting array of toppings.",
  price_range: "$$",
  status: "Open",
  open_time: rand(9..11),
  close_time: rand(10..12),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  # creating a user for each restaurant
  user: pitch_owner
)
# creating queuers in history for the pitch
200.times do
  Queuer.create!(
    reservation_name: Faker::Name.name,
    user_id: pitch_owner.id,
    restaurant_id: pitch_seed1.id,
    size: rand(1..10),
    status: "completed",
    actual_wait_time: 0,
    created_at: (rand * 15).days.ago
  )
end


  # creating active queuers for the pitch
10.times do
  Queuer.create!(
    reservation_name: Faker::Name.name,
    user_id: pitch_owner.id,
    restaurant_id: pitch_seed1.id,
    size: rand(1..10),
    status: "queuing",
    actual_wait_time: 0
  )
end

puts "DONE! You now have 15 Users and 15 Restaurants in the DB..."
