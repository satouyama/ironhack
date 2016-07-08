# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Concert.create(
  [
    {artist:"haha",venue:"haha venue",city: "haha city",date:Time.now + 10.day, price:150,description:"haha good"},
    {artist:"hehe",venue:"hehe venue",city: "hehe city",date:Time.now, price:100,description:"hehe good"},
    {artist:"hihi",venue:"hihi venue",city: "hihi city",date:Time.now + 1.month, price:200,description:"hihi good"},
    {artist:"hoho",venue:"hoho venue",city: "hoho city",date:Time.now + 60.day, price:40,description:"hoho good"},
    {artist:"hmhm",venue:"hmhm venue",city: "hmhm city",date:Time.now + 2.day, price:30,description:"hmhm good"},
    {artist:"huhu",venue:"huhu venue",city: "huhu city",date:Time.now + 1.day, price:100,description:"huhu good"}
 ])


 Comment.create([
    {user_name: "troll1",comment:"this is great",concert_id: 1},
    {user_name: "troll2",comment:"this is great",concert_id: 2},
    {user_name: "troll3",comment:"this is great",concert_id: 3},
    {user_name: "troll4",comment:"this is great",concert_id: 4},
    {user_name: "troll5",comment:"this is great",concert_id: 5},
  ])


 Concert.find_each { |concert| Concert.reset_counters(concert.id, :comments) }



City.create([
  {name: "Miami"},
  {name: "London"},
  {name: "Shanghai"},
  {name: "New York"},
  {name: "New Delhi"},
  {name: "Rio"},
  {name: "Chicago"}
  ])
