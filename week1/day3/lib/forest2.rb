class Forest < Space	
	def condition
		"Burn this place"
	end

	def initialize(player)
		puts "You are in a forest"
		@player = player
		@player_location = player.position

		check_currgent_exit
		intended_direction = ask_direction
		move_result = @player.move(intended_direction)
		check_special(intended_direction)
	
	end

	# def activation
	# 	puts "You are KILLED"
	# end

end