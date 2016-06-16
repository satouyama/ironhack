class Room < Space
	def condition
		"Look for bathroom"
	end

	def initialize
		puts "You are in a dark dark room..."
	end

	def activation
		puts "You are KILLED"
		
	end



end