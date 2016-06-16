class Space
	def condition
		"happy"
	end

	def check_special input
		#puts "input is #{input}"
		#puts "condition is #{condition}"
		if input == condition.upcase
			#puts "activation"
			activation
		else
			#puts "deactivation"
			none_found
		end	
	end

	def activation
		puts "lolo"
	end

	def none_found
		puts "not much going on here."
	end


end