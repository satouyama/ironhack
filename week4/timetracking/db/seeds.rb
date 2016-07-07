# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



(1..100).each do | num |
    p = Project.new(name: "Project number #{num}", description: "Description for project number #{num}")
    p.save
    p.time_entries.create(hours: num, minutes: (rand * 11).floor, date: Date.current + num.hours,project_id:num)
end


# Project.create([{name:"ironHACK",description:"Coding BOOOTCAMP"},{name:"papa johns", description:"hahaha"},{name:"taco bell",description:"great"}])

# Project.create([{name:"apple",description:"Coding BOOOTCAMP"},{name:"peach", description:"hahaha"},{name:"eat it",description:"great"}])


# Project.create([{name:"banana",description:"Coding BOOOTCAMP"},{name:"watermelon", description:"hahaha"},{name:"drop it",description:"great"}])


# TimeEntry.create(
#   [ 
#     {hours: 1,
#     minutes: 45,
#     comments: "Did stuff",
#     date: Time.now,
#     project_id: Project.find_by(name:"ironHACK").id},
   
#     {hours: 2,
#     minutes: 43,
#     comments: "eat stuff",
#     date: Time.now,
#     project_id: Project.find_by(name:"papa johns").id},
   
#     {hours: 3,
#     minutes: 12,
#     comments: "shit stuff",
#     date: Time.now,
#     project_id: Project.find_by(name:"eat it").id},

#     {hours: 1,
#     minutes: 45,
#     comments: "drink stuff",
#     date: Time.now,
#     project_id: Project.find_by(name:"watermelon").id},

#     {hours: 1,
#     minutes: 45,
#     comments: "Did stuff",
#     date: Time.now,
#     project_id: Project.find_by(name:"taco bell").id},
   
#     {hours: 2,
#     minutes: 43,
#     comments: "eat stuff",
#     date: Time.now,
#     project_id: Project.find_by(name:"apple").id},
   
#     {hours: 3,
#     minutes: 12,
#     comments: "shit stuff",
#     date: Time.now,
#     project_id: Project.find_by(name:"banana").id},

#     {hours: 1,
#     minutes: 45,
#     comments: "drink stuff",
#     date: Time.now,
#     project_id: Project.find_by(name:"peach").id},

#     {hours: 1,
#     minutes: 45,
#     comments: "drink stuff",
#     date: Time.now,
#     project_id: Project.find_by(name:"drop it").id},

#   ])