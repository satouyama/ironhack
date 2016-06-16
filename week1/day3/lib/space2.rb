class Space
	def initialize player
		@player = player
		@player_location = player.position

		check_currgent_exit
		intended_direction = ask_direction
		move_result = @player.move(intended_direction)
		
		if move_result == "special"
			check_special(intended_direction)
		end


	end
	def 
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

	def check_currgent_exit 
		if @player_location[0] == 0 && @player_location[1] == 0
			exits = "S E"
		elsif @player_location[0] ==3 && @player_location[1] == 0
			exits = "N E"
		elsif @player_location[0] ==0 && @player_location[1] == 3
			exits = "W S"
		elsif @player_location[0] ==3 && @player_location[1] == 3
			exits = "N W"
		elsif @player_location[0] == 0
			exits = "W S E"
		elsif @player_location[0] == 3
			exits = "N E W"
		elsif @player_location[1] == 0
			exits = "S N E"
		elsif @player_location[1] == 3
			exits = "W S N"
		else 
			exits = "N S W E"
		end
		puts "You can take these exits: #{exits}"	
#		@exit_condition
	end
	def ask_direction
		
		puts "Which way do you want to go?"
		input = gets.chomp.upcase
	end


	def activation
		puts "You are KIIILLLLED"
	end

	def none_found
		puts "not much going on here."
	end


end