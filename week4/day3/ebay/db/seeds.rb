# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(
  [
    {name:"haha",email:"haha@haha.com"},
    {name:"hehe",email:"hehe@haha.com"},
    {name:"hoho",email:"hoho@haha.com"},
    {name:"hihi",email:"hihi@haha.com"},
    {name:"huhu",email:"huhu@haha.com"},
    {name:"hmhm",email:"hmhm@haha.com"},
  ]
  )


Product.create(
 [
    {title:"food",description:"haha@haha.com",deadline:(Time.now + 1.hour),user_id:1},
    {title:"aplle",description:"hehe@haha.com",deadline:(Time.now + 1.hour),user_id:2},
    {title:"pig",description:"hoho@haha.com",deadline:(Time.now + 1.hour),user_id:3},
    {title:"juice",description:"hihi@haha.com",deadline:(Time.now + 1.hour),user_id:4},
    {title:"idont'know",description:"huhu@haha.com",deadline:(Time.now + 1.hour),user_id:5},
    {title:"this",description:"hmhm@haha.com",deadline:(Time.now + 1.hour),user_id:6}
  ]
)


Bid.create(
  [
    {amount:"100",bidder_email:"hehe@haha.com",product_id:1},
    {amount:"100",bidder_email:"haha@haha.com",product_id:2},
    {amount:"100",bidder_email:"hihi@haha.com",product_id:3},
    {amount:"100",bidder_email:"hoho@haha.com",product_id:4},
    {amount:"100",bidder_email:"hmhm@haha.com",product_id:5},
    {amount:"100",bidder_email:"huhu@haha.com",product_id:6}
  ]
)