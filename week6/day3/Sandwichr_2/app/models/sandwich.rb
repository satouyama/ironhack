class Sandwich < ApplicationRecord
	# attr_accesssible :total_calories

	has_many :sandwich_ingredients
	has_many :ingredients, through: :sandwich_ingredients, after_add: :add_calories


	def add_calories(ingredient)

	
		self.total_calories= total_calories + ingredient.calories

		p ingredient.calories
		p total_calories 

		save
		

	end

end
