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

puts "destroying all reviews..."
Review.destroy_all

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
  '3-10-13 Meguro, Meguro, Tokyo',
  '2-11-8 Meguro, Meguro, Tokyo',
  '4-14-5 Meguro, Meguro, Tokyo 153-0063, Japan',
  "2-3-3, Azabudai , Minato, Tokyo ",
  "100-1072, Funabashi, Setagaya, Tokyo",
  "2-3-2, KoIshikawa , Bunkyo, Tokyo",
  "1-5-10, Minami Azabu, Minato, Tokyo",
  "491-1123, Roppongi, Minato, Tokyo",
  "5-3-1, Akasaka, Minato, Tokyo",
  "21-3, Ebisu 1-chome, Shibuya-ku, Tokyo",
  "3-5, Akasaka 3-chome, Minato-ku, Tokyo",
  "1-5, Toranomon 5-chome, Minato-ku, Tokyo",
  "1-39, Hiroo 1-chome, Shibuya-ku, Tokyo",
  "5-22, Higashigaoka 1-chome, Meguro-ku, Tokyo",
  "38-6, Sendagaya 2-chome, Shibuya-ku, Tokyo",
  "1-25, Ariake 3-chome, Koto-ku, Tokyo",
  "7-35, Kita Shinagawa 6-chome, Shinagawa-ku, Tokyo",
  "5-7, Ariake 2-chome, Koto-ku, Tokyo",
  "3-9, Shinbashi 3-chome, Minato-ku, Tokyo",
  "5-14, Nihonbashi 3-chome, Chuo-ku, Tokyo",
  "1151-1-chome Aoi, Adachi-ku, Tokyo",
  "4-10, Shoto 2-chome, Shibuya-ku, Tokyo",
  "8-1, Higashi Shinbashi 1-chome, Minato-ku, Tokyo",
  "9-10, Tsukiji 3-chome, Chuo-ku, Tokyo",
  "32-3, Shiba 3-chome, Minato-ku, Tokyo",
  "12-1, Dogenzaka 1-chome, Shibuya-ku, Tokyo",
  "6-16, Okubo 2-chome,  Shinjuku-ku, Tokyo",
  "10-3, Ginza 4-chome, Chuo-ku, Tokyo"
  # 30
]
# Store fronts
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
photos33 = URI.open("https://images.unsplash.com/photo-1555396273-367ea4eb4db5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80")
photos34 = URI.open("https://images.unsplash.com/photo-1571234809192-88b1c7a2521b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80")
photos35 = URI.open("https://images.unsplash.com/photo-1494122474412-aeaf73d11da8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
photos36 = URI.open("https://images.unsplash.com/photo-1517638851339-a711cfcf3279?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
photos37 = URI.open("https://images.unsplash.com/photo-1621465558419-1deb2e51b530?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2916&q=80")
photos38 = URI.open("https://images.unsplash.com/photo-1640145900690-042ee858e722?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
photos39 = URI.open("https://images.unsplash.com/photo-1580990640889-53c555a7dfa3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
photos40 = URI.open("https://images.unsplash.com/photo-1589918247024-c2c9da95da47?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
photos41 = URI.open("https://images.unsplash.com/photo-1559339352-11d035aa65de?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80")
photos42 = URI.open("https://images.unsplash.com/photo-1522336572468-97b06e8ef143?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1476&q=80")
photos43 = URI.open("https://images.unsplash.com/photo-1579027989536-b7b1f875659b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
photos44 = URI.open("https://images.unsplash.com/photo-1589793140477-0885a4d00e33?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=685&q=80")
photos45 = URI.open("https://images.unsplash.com/photo-1603418735208-86f031556a5a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1931&q=80")
photos46 = URI.open("https://images.unsplash.com/photo-1597079307827-b7b70f63c185?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2831&q=80")
photos47 = URI.open("https://images.unsplash.com/photo-1526199119161-4be1e3368d52?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80")
photos48 = URI.open("https://images.unsplash.com/photo-1650546867609-c0151a0486c8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80")
photos49 = URI.open("https://images.unsplash.com/photo-1601313365958-2b35807578ae?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
# Inside Photos
photos50 = URI.open("https://images.unsplash.com/photo-1562436356-11574662e477?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
photos51 = URI.open("https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2940&q=80")
photos52 = URI.open("https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=781&q=80")
photos53 = URI.open("https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=780&q=80")
photos54 = URI.open("https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80")
photos55 = URI.open("https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2787&q=80")
photos56 = URI.open("https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80")
photos57 = URI.open("https://images.unsplash.com/photo-1499028344343-cd173ffc68a9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
photos58 = URI.open("https://images.unsplash.com/photo-1476224203421-9ac39bcb3327?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
photos59 = URI.open("https://images.unsplash.com/photo-1504754524776-8f4f37790ca0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
photos60 = URI.open("https://images.unsplash.com/photo-1565299585323-38d6b0865b47?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=780&q=80")
photos61 = URI.open("https://images.unsplash.com/photo-1496116218417-1a781b1c416c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
photos62 = URI.open("https://images.unsplash.com/photo-1432139555190-58524dae6a55?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1476&q=80")
photos63 = URI.open("https://images.unsplash.com/photo-1586511925558-a4c6376fe65f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80")
photos64 = URI.open("https://images.unsplash.com/photo-1539136788836-5699e78bfc75?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
photos65 = URI.open("https://images.unsplash.com/photo-1543339308-43e59d6b73a6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
photos66 = URI.open("https://images.unsplash.com/photo-1607013251379-e6eecfffe234?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80")
photos67 = URI.open("https://images.unsplash.com/photo-1540914124281-342587941389?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80")
photos68 = URI.open("https://images.unsplash.com/photo-1562059390-a761a084768e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1419&q=80")
photos69 = URI.open("https://images.unsplash.com/photo-1557748362-4e95f0de4f6f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1088&q=80")
photos70 = URI.open("https://images.unsplash.com/photo-1562967916-eb82221dfb92?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80")
photos71 = URI.open("https://images.unsplash.com/photo-1516100882582-96c3a05fe590?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80")
photos72 = URI.open("https://images.unsplash.com/photo-1593854823220-49d01bebbfdc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=664&q=80")
photos73 = URI.open("https://images.unsplash.com/photo-1544025162-d76694265947?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80")
photos74 = URI.open("https://images.unsplash.com/photo-1551024601-bec78aea704b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80")
photos75 = URI.open("https://images.unsplash.com/photo-1594212699903-ec8a3eca50f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1471&q=80")
photos76 = URI.open("https://images.unsplash.com/photo-1606066889831-35faf6fa6ff6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80")
photos77 = URI.open("https://images.unsplash.com/photo-1560130934-590b85fc08e7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1932&q=80")
photos78 = URI.open("https://images.unsplash.com/photo-1602748828300-2843df3b3923?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1471&q=80")
photos79 = URI.open("https://images.unsplash.com/photo-1602748828261-153838b059b4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
photos80 = URI.open("https://images.unsplash.com/photo-1498654896293-37aacf113fd9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
photos81 = URI.open("https://images.unsplash.com/photo-1471253794676-0f039a6aae9d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
photos82 = URI.open("https://images.unsplash.com/photo-1488992783499-418eb1f62d08?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1889&q=80")
photos83 = URI.open("https://images.unsplash.com/photo-1581349485608-9469926a8e5e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80")
photos84 = URI.open("https://images.unsplash.com/photo-1587899897387-091ebd01a6b2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1513&q=80")
photos85 = URI.open("https://images.unsplash.com/photo-1611765083444-a3ce30f1c885?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80")
photos86 = URI.open("https://images.unsplash.com/photo-1592417817038-d13fd7342605?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
photos87 = URI.open("https://images.unsplash.com/photo-1514134583630-250e42c36dbd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80")
photos88 = URI.open("https://images.unsplash.com/photo-1541614101331-1a5a3a194e92?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80")
photos89 = URI.open("https://images.unsplash.com/photo-1590577976322-3d2d6e2130d5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
photos90 = URI.open("https://images.unsplash.com/photo-1505275350441-83dcda8eeef5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80")
photos91 = URI.open("https://images.unsplash.com/photo-1529003600303-bd51f39627fb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
photos92 = URI.open("https://images.unsplash.com/photo-1447279506476-3faec8071eee?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
photos93 = URI.open("https://images.unsplash.com/photo-1603894483390-dc12ecd2c9dd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=733&q=80")
photos94 = URI.open("https://images.unsplash.com/photo-1508955080361-a155a8773c13?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=733&q=80")
photos95 = URI.open("https://images.unsplash.com/photo-1414235077428-338989a2e8c0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
photos96 = URI.open("https://images.unsplash.com/photo-1424847651672-bf20a4b0982b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
photos97 = URI.open("https://images.unsplash.com/photo-1498654896293-37aacf113fd9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
photos98 = URI.open("https://images.unsplash.com/photo-1587574293340-e0011c4e8ecf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1632&q=80")
photos99 = URI.open("https://images.unsplash.com/photo-1485182708500-e8f1f318ba72?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1510&q=80")
photos100 = URI.open("https://images.unsplash.com/photo-1587899897387-091ebd01a6b2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1513&q=80")
photos101 = URI.open("https://images.unsplash.com/photo-1590577976322-3d2d6e2130d5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
photos102 = URI.open("https://images.unsplash.com/photo-1502998070258-dc1338445ac2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=679&q=80")
photos103 = URI.open("https://images.unsplash.com/photo-1515668236457-83c3b8764839?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80")
photos104 = URI.open("https://images.unsplash.com/photo-1484723091739-30a097e8f929?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=749&q=80")
photos105 = URI.open("https://images.unsplash.com/photo-1576829824883-bf9e6b522252?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80")
photos106 = URI.open("https://images.unsplash.com/photo-1565895405140-6b9830a88c19?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1471&q=80")
photos107 = URI.open("https://images.unsplash.com/photo-1512132411229-c30391241dd8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
photos108 = URI.open("https://images.unsplash.com/photo-1526318896980-cf78c088247c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80")
photos109 = URI.open("https://images.unsplash.com/photo-1569137735645-bfb33825333b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=736&q=80")

user1 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant1 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses[0],
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Open", "Opening soon", "Closed"].sample,
  open_time: rand(9..12),
  close_time: rand(21..23),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user1.id
)
restaurant1.photos.attach(io: photos1, filename: 'user.png', content_type: 'image/png')
restaurant1.photos.attach(io: photos50, filename: 'user.png', content_type: 'image/png')
restaurant1.photos.attach(io: photos51, filename: 'user.png', content_type: 'image/png')


user2 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant2 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses[1],
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Open", "Opening soon", "Closed"].sample,
  open_time: rand(9..11),
  close_time: rand(21..23),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user2.id
)
restaurant2.photos.attach(io: photos2, filename: 'user.png', content_type: 'image/png')
restaurant2.photos.attach(io: photos52, filename: 'user.png', content_type: 'image/png')
restaurant2.photos.attach(io: photos53, filename: 'user.png', content_type: 'image/png')

user3 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant3 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses[2],
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Open", "Opening soon", "Closed"].sample,
  open_time: rand(9..11),
  close_time: rand(21..23),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user3.id
)
restaurant3.photos.attach(io: photos3, filename: 'user.png', content_type: 'image/png')
restaurant3.photos.attach(io: photos54, filename: 'user.png', content_type: 'image/png')
restaurant3.photos.attach(io: photos55, filename: 'user.png', content_type: 'image/png')

user4 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant4 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses[3],
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Open", "Opening soon", "Closed"].sample,
  open_time: rand(9..11),
  close_time: rand(21..23),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user4.id
)
restaurant4.photos.attach(io: photos4, filename: 'user.png', content_type: 'image/png')
restaurant4.photos.attach(io: photos56, filename: 'user.png', content_type: 'image/png')
restaurant4.photos.attach(io: photos57, filename: 'user.png', content_type: 'image/png')

user5 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant5 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses[4],
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Open", "Opening soon", "Closed"].sample,
  open_time: rand(9..11),
  close_time: rand(21..23),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user5.id
)

restaurant5.photos.attach(io: photos5, filename: 'user.png', content_type: 'image/png')
restaurant5.photos.attach(io: photos58, filename: 'user.png', content_type: 'image/png')
restaurant5.photos.attach(io: photos59, filename: 'user.png', content_type: 'image/png')

user6 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant6 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses[5],
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Open", "Opening soon", "Closed"].sample,
  open_time: rand(9..11),
  close_time: rand(21..23),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user6.id
)
restaurant6.photos.attach(io: photos6, filename: 'user.png', content_type: 'image/png')
restaurant6.photos.attach(io: photos60, filename: 'user.png', content_type: 'image/png')
restaurant6.photos.attach(io: photos61, filename: 'user.png', content_type: 'image/png')

user7 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant7 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses[6],
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Open", "Opening soon", "Closed"].sample,
  open_time: rand(9..11),
  close_time: rand(21..23),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user7.id
)
restaurant7.photos.attach(io: photos7, filename: 'user.png', content_type: 'image/png')
restaurant7.photos.attach(io: photos62, filename: 'user.png', content_type: 'image/png')
restaurant7.photos.attach(io: photos63, filename: 'user.png', content_type: 'image/png')

user8 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant8 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses[7],
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Open", "Opening soon", "Closed"].sample,
  open_time: rand(9..11),
  close_time: rand(21..23),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user8.id
)
restaurant8.photos.attach(io: photos8, filename: 'user.png', content_type: 'image/png')
restaurant8.photos.attach(io: photos64, filename: 'user.png', content_type: 'image/png')
restaurant8.photos.attach(io: photos65, filename: 'user.png', content_type: 'image/png')

user9 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant9 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses[8],
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Open", "Opening soon", "Closed"].sample,
  open_time: rand(9..11),
  close_time: rand(21..23),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user9.id
)
restaurant9.photos.attach(io: photos9, filename: 'user.png', content_type: 'image/png')
restaurant9.photos.attach(io: photos66, filename: 'user.png', content_type: 'image/png')
restaurant9.photos.attach(io: photos67, filename: 'user.png', content_type: 'image/png')

user10 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant10 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses[9],
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Open", "Opening soon", "Closed"].sample,
  open_time: rand(9..11),
  close_time: rand(21..23),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user10.id
)
restaurant10.photos.attach(io: photos10, filename: 'user.png', content_type: 'image/png')
restaurant10.photos.attach(io: photos68, filename: 'user.png', content_type: 'image/png')
restaurant10.photos.attach(io: photos69, filename: 'user.png', content_type: 'image/png')

user11 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant11 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses[10],
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Open", "Opening soon", "Closed"].sample,
  open_time: rand(9..11),
  close_time: rand(21..23),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user11.id
)
restaurant11.photos.attach(io: photos11, filename: 'user.png', content_type: 'image/png')
restaurant11.photos.attach(io: photos70, filename: 'user.png', content_type: 'image/png')
restaurant11.photos.attach(io: photos71, filename: 'user.png', content_type: 'image/png')

user12 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant12 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses[11],
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Open", "Opening soon", "Closed"].sample,
  open_time: rand(9..11),
  close_time: rand(21..23),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user12.id
)
restaurant12.photos.attach(io: photos12, filename: 'user.png', content_type: 'image/png')
restaurant12.photos.attach(io: photos72, filename: 'user.png', content_type: 'image/png')
restaurant12.photos.attach(io: photos73, filename: 'user.png', content_type: 'image/png')

user13 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant13 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses[12],
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Open", "Opening soon", "Closed"].sample,
  open_time: rand(9..11),
  close_time: rand(21..23),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user13.id
)
restaurant13.photos.attach(io: photos13, filename: 'user.png', content_type: 'image/png')
restaurant13.photos.attach(io: photos74, filename: 'user.png', content_type: 'image/png')
restaurant13.photos.attach(io: photos75, filename: 'user.png', content_type: 'image/png')

user14 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant14 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses[13],
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Open", "Opening soon", "Closed"].sample,
  open_time: rand(9..11),
  close_time: rand(21..23),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user14.id
)
restaurant14.photos.attach(io: photos14, filename: 'user.png', content_type: 'image/png')
restaurant14.photos.attach(io: photos76, filename: 'user.png', content_type: 'image/png')
restaurant14.photos.attach(io: photos77, filename: 'user.png', content_type: 'image/png')

user15 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant15 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses[14],
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Open", "Opening soon", "Closed"].sample,
  open_time: rand(9..11),
  close_time: rand(21..23),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user15.id
)
restaurant15.photos.attach(io: photos15, filename: 'user.png', content_type: 'image/png')
restaurant15.photos.attach(io: photos78, filename: 'user.png', content_type: 'image/png')
restaurant15.photos.attach(io: photos79, filename: 'user.png', content_type: 'image/png')

user16 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant16 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses[15],
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Open", "Opening soon", "Closed"].sample,
  open_time: rand(9..11),
  close_time: rand(21..23),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user16.id
)
restaurant16.photos.attach(io: photos16, filename: 'user.png', content_type: 'image/png')
restaurant16.photos.attach(io: photos80, filename: 'user.png', content_type: 'image/png')
restaurant16.photos.attach(io: photos81, filename: 'user.png', content_type: 'image/png')

user17 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant17 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses[16],
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Open", "Opening soon", "Closed"].sample,
  open_time: rand(9..11),
  close_time: rand(21..23),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user17.id
)
restaurant17.photos.attach(io: photos17, filename: 'user.png', content_type: 'image/png')
restaurant17.photos.attach(io: photos82, filename: 'user.png', content_type: 'image/png')
restaurant17.photos.attach(io: photos83, filename: 'user.png', content_type: 'image/png')

user18 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant18 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses[17],
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Open", "Opening soon", "Closed"].sample,
  open_time: rand(9..11),
  close_time: rand(21..23),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user18.id
)
restaurant18.photos.attach(io: photos18, filename: 'user.png', content_type: 'image/png')
restaurant18.photos.attach(io: photos84, filename: 'user.png', content_type: 'image/png')
restaurant18.photos.attach(io: photos85, filename: 'user.png', content_type: 'image/png')

user19 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant19 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses[18],
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Open", "Opening soon", "Closed"].sample,
  open_time: rand(9..11),
  close_time: rand(21..23),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user19.id
)
restaurant19.photos.attach(io: photos19, filename: 'user.png', content_type: 'image/png')
restaurant19.photos.attach(io: photos86, filename: 'user.png', content_type: 'image/png')
restaurant19.photos.attach(io: photos87, filename: 'user.png', content_type: 'image/png')

user20 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant20 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses[19],
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Open", "Opening soon", "Closed"].sample,
  open_time: rand(9..11),
  close_time: rand(21..23),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user20.id
)
restaurant20.photos.attach(io: photos20, filename: 'user.png', content_type: 'image/png')
restaurant20.photos.attach(io: photos88, filename: 'user.png', content_type: 'image/png')
restaurant20.photos.attach(io: photos89, filename: 'user.png', content_type: 'image/png')

user21 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant21 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses[20],
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Open", "Opening soon", "Closed"].sample,
  open_time: rand(9..11),
  close_time: rand(21..23),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user21.id
)
restaurant21.photos.attach(io: photos21, filename: 'user.png', content_type: 'image/png')
restaurant21.photos.attach(io: photos90, filename: 'user.png', content_type: 'image/png')
restaurant21.photos.attach(io: photos91, filename: 'user.png', content_type: 'image/png')

user22 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant22 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses[21],
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Open", "Opening soon", "Closed"].sample,
  open_time: rand(9..11),
  close_time: rand(21..23),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user22.id
)
restaurant22.photos.attach(io: photos22, filename: 'user.png', content_type: 'image/png')
restaurant22.photos.attach(io: photos92, filename: 'user.png', content_type: 'image/png')
restaurant22.photos.attach(io: photos93, filename: 'user.png', content_type: 'image/png')

user23 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant23 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses[22],
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Open", "Opening soon", "Closed"].sample,
  open_time: rand(9..11),
  close_time: rand(21..23),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user23.id
)
restaurant23.photos.attach(io: photos23, filename: 'user.png', content_type: 'image/png')
restaurant23.photos.attach(io: photos94, filename: 'user.png', content_type: 'image/png')
restaurant23.photos.attach(io: photos95, filename: 'user.png', content_type: 'image/png')

user24 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant24 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses[23],
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Open", "Opening soon", "Closed"].sample,
  open_time: rand(9..11),
  close_time: rand(21..23),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user24.id
)
restaurant24.photos.attach(io: photos24, filename: 'user.png', content_type: 'image/png')
restaurant24.photos.attach(io: photos96, filename: 'user.png', content_type: 'image/png')
restaurant24.photos.attach(io: photos97, filename: 'user.png', content_type: 'image/png')

user25 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant25 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses[24],
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Open", "Opening soon", "Closed"].sample,
  open_time: rand(9..11),
  close_time: rand(21..23),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user25.id
)
restaurant25.photos.attach(io: photos25, filename: 'user.png', content_type: 'image/png')
restaurant25.photos.attach(io: photos98, filename: 'user.png', content_type: 'image/png')
restaurant25.photos.attach(io: photos99, filename: 'user.png', content_type: 'image/png')

user26 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant26 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses[25],
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Open", "Opening soon", "Closed"].sample,
  open_time: rand(9..11),
  close_time: rand(21..23),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user26.id
)
restaurant26.photos.attach(io: photos26, filename: 'user.png', content_type: 'image/png')
restaurant26.photos.attach(io: photos100, filename: 'user.png', content_type: 'image/png')
restaurant26.photos.attach(io: photos101, filename: 'user.png', content_type: 'image/png')

user27 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant27 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses[26],
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Open", "Opening soon", "Closed"].sample,
  open_time: rand(9..11),
  close_time: rand(21..23),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user27.id
)
restaurant27.photos.attach(io: photos27, filename: 'user.png', content_type: 'image/png')
restaurant27.photos.attach(io: photos102, filename: 'user.png', content_type: 'image/png')
restaurant27.photos.attach(io: photos103, filename: 'user.png', content_type: 'image/png')

user28 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant28 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses[27],
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Open", "Opening soon", "Closed"].sample,
  open_time: rand(9..11),
  close_time: rand(21..23),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user28.id
)
restaurant28.photos.attach(io: photos28, filename: 'user.png', content_type: 'image/png')
restaurant28.photos.attach(io: photos104, filename: 'user.png', content_type: 'image/png')
restaurant28.photos.attach(io: photos105, filename: 'user.png', content_type: 'image/png')

user29 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant29 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses[28],
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Open", "Opening soon", "Closed"].sample,
  open_time: rand(9..11),
  close_time: rand(21..23),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user29.id

)
restaurant29.photos.attach(io: photos29, filename: 'user.png', content_type: 'image/png')
restaurant29.photos.attach(io: photos106, filename: 'user.png', content_type: 'image/png')
restaurant29.photos.attach(io: photos107, filename: 'user.png', content_type: 'image/png')

user30 = User.create!(
  email: Faker::Internet.email,
  password: "123456"
)

restaurant30 = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: addresses[29],
  category: Faker::Restaurant.type,
  description: Faker::Restaurant.description,
  price_range: %w[$ $$ $$$ $$$$].sample,
  status: ["Open", "Opening soon", "Closed"].sample,
  open_time: rand(9..11),
  close_time: rand(21..23),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  user_id: user30.id
)
restaurant30.photos.attach(io: photos30, filename: 'user.png', content_type: 'image/png')
restaurant30.photos.attach(io: photos108, filename: 'user.png', content_type: 'image/png')
restaurant30.photos.attach(io: photos109, filename: 'user.png', content_type: 'image/png')

# Adding queuers to each restaurant
Restaurant.all.each do |restaurant|
  if restaurant.status == "Open"
    10.times do
      Queuer.create!(
        reservation_name: Faker::Name.name,
        user_id: restaurant.user.id,
        restaurant_id: restaurant.id,
        size: rand(1..10),
        status: ["queuing", "dining", "completed"].sample
      )
    end
  end
end

Restaurant.all.each do |restaurant|
  rand(5..15).times do
    Review.create!(
      content: Faker::Restaurant.review,
      restaurant: restaurant
    )
  end
end

pitch_owner = User.create!(
  password: "123456",
  email: "thegyozaacademy@real.com",
  phone: "+819038186033",
  role: "owner"
)

pitch_user = User.create!(
  password: "123456",
  email: "user@real.com",
  phone: "+817084322979",
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
  close_time: rand(21..23),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  # creating a user for each restaurant
  user: pitch_owner
)
pitch_photo1 = URI.open("https://images.unsplash.com/photo-1622888633849-0a44e9fab3e2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2094&q=80")
pitch_photo2 = URI.open("https://images.unsplash.com/photo-1588182728399-e8f2df121744?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80")
pitch_photo3 = URI.open("https://images.unsplash.com/photo-1571865705992-762a1f078b3c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1829&q=80")
pitch_photo4 = URI.open("https://images.unsplash.com/photo-1633805232927-8d6aca1cd206?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")

pitch_seed1.photos.attach(io: pitch_photo1, filename: 'user.png', content_type: 'image/png')
pitch_seed1.photos.attach(io: pitch_photo2, filename: 'user.png', content_type: 'image/png')
pitch_seed1.photos.attach(io: pitch_photo3, filename: 'user.png', content_type: 'image/png')
pitch_seed1.photos.attach(io: pitch_photo4, filename: 'user.png', content_type: 'image/png')


  rand(5..15).times do
    Review.create!(
      content: Faker::Restaurant.review,
      restaurant: pitch_seed1
    )
  end

pitch_seed2 = Restaurant.create!(
  name: "Bamboo Gyoza",
  address: "Shibuya",
  category: "Chinese",
  description: "The Bamboo Gyoza offers a wide range of varieties – prawn, chicken, beef, vegetables, pork – with an interesting array of toppings.",
  price_range: "$$",
  status: "Open",
  open_time: rand(9..11),
  close_time: rand(21..23),
  capacity: rand(20..50),
  total_wait_time: 0,
  time_per_person: 3,
  # creating a user for each restaurant
  user: pitch_owner
)
# creating queuers in history for the pitch
Queuer.create!(
  reservation_name: Faker::Name.name,
  user_id: pitch_user.id,
  restaurant_id: pitch_seed1.id,
  size: 2,
  status: "queuing",
  actual_wait_time: 0
)

200.times do
  Queuer.create!(
    reservation_name: Faker::Name.name,
    user_id: pitch_user.id,
    restaurant_id: pitch_seed1.id,
    size: rand(1..10),
    status: "completed",
    actual_wait_time: 0,
    created_at: (rand * 15).days.ago
  )
end
  # creating active queuers for the pitch
5.times do
  Queuer.create!(
    reservation_name: Faker::Name.name,
    user_id: pitch_user.id,
    restaurant_id: pitch_seed1.id,
    size: rand(1..8),
    status: "queuing",
    actual_wait_time: 0
  )
end

5.times do
  Queuer.create!(
    reservation_name: Faker::Name.name,
    user_id: pitch_user.id,
    restaurant_id: pitch_seed1.id,
    size: rand(1..8),
    status: "dining",
    actual_wait_time: 0
  )
end

5.times do
  user = User.create!(
  email: Faker::Internet.safe_email,
  password: '123123', # needs to be 6 digits,
  phone: "+817084322979"
  # add any additional attributes you have on your model
)
file = URI.open('https://thispersondoesnotexist.com/image')
user.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')
end

puts "DONE! You now have 30 Users and 30 Restaurants in the DB..."
