# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

buffalo = Sandwich.create(name: "buffalo", bread_type: "white")
turkey = Sandwich.create(name:"turkey", bread_type: "wheat")

smoked_turkey = Ingredient.create(name:"smoked_turkey", calories:"80")
monster_cheese = Ingredient.create(name:"monster_cheese", calories:"70")


# SandwichIngredient.create(sandwich_id:turkey.id,ingredient_id:smoked_turkey.id)

turkey.ingredients.push( smoked_turkey )