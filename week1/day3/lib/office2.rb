class Office < Space
	def condition
		"cry in fetal position"
	end

	def initialize(player)
		puts "You are in an office"
		super
# 		@player = player
# 		@player_location = player.position

# 		check_current_exit
# 		intended_direction = ask_direction
# 		move_result = @player.move(intended_direction)
# #		check_special(intended_direction)
# 		#puts "move_result current value #{move_result}"
		
# 		if move_result == "special"
# 		#	puts "# move_result value is #{move_result}" 
# 			check_special(intended_direction)
# 		end
	end
	# def activation
	# 	puts "You are KILLED"

	# end

end