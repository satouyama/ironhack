class Forest < Space	
	def condition
		"Burn this place"
	end

	def initialize
		puts "You are in a forest"
	end

	def activation
		puts "You are KILLED"
	end

end