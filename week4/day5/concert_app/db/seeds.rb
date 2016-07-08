# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Concert.create(
  [
    {artist:"haha",venue:"haha venue",city: "haha city",date:Time.now + 10.day, price:100,description:"haha good"},
    {artist:"hehe",venue:"hehe venue",city: "hehe city",date:Time.now, price:100,description:"hehe good"},
    {artist:"hihi",venue:"hihi venue",city: "hihi city",date:Time.now + 1.month, price:100,description:"hihi good"},
    {artist:"hoho",venue:"hoho venue",city: "hoho city",date:Time.now + 60.day, price:100,description:"hoho good"},
    {artist:"hmhm",venue:"hmhm venue",city: "hmhm city",date:Time.now + 2.day, price:100,description:"hmhm good"},
    {artist:"huhu",venue:"huhu venue",city: "huhu city",date:Time.now + 1.day, price:100,description:"huhu good"},
  ])