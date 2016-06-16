require_relative("lib/player.rb")
require_relative("lib/space.rb")
require_relative("lib/room.rb")
require_relative("lib/forest.rb")
require_relative("lib/office.rb")
require_relative("lib/bar.rb")

=begin

space1 = Forest.new("N,W","A Jar of Honey imported from Miami")
space2 = Bar.new("W,S","A Pink Bear Crying in Fetal Position")
space3 = Office.new("N,E","A dark room with Michael Scott staring at you")
space4 = Office.new("S,E","A dark room where Angela and Dwight are making out")
space5 = Bar.new("S","An Irish man buying you a drink")

=end

grid = [
	[0,1,0,0],
	[0,1,3,2],
	[3,0,0,0],
	[0,0,2,4],
]


puts "Welcome to the Game of Throoms."
puts "       Valar Morghulis        "
puts "            Y/N    ?             "

input_start = gets.chomp.downcase

if input_start == "n"
	puts "you don't really have a choice"
else
	puts "good luck!"
	puts "bonus moves: "
	puts "1. look for bathroom"
	puts "2. burn this place"
	puts "3. start a fight"
	puts "4. cry in fetal position"
end

player1 = Player.new

i = 0
while i <100
	#puts "in the loop"
	index_a = player1.position[0]
	index_b = player1.position[1]

	space_value = grid[index_a][index_b]    #3 getting the value for current spot
	#puts space_value.class
	if space_value == 0
#		puts "first value satisfied"
		space1 = Room.new
		break if player1.check_current_exit(space1)  =="exit"
	elsif space_value == 1
		puts "forest"
		space2 = Forest.new
#		player1.check_current_exit space2
		break if player1.check_current_exit(space2) == "exit"
	elsif space_value ==2
		space3 = Bar.new
#		player1.check_current_exit space3
		break if player1.check_current_exit(space3) == "exit"
	elsif space_value ==3
		space4 = Office.new
#		player1.check_current_exit space4
		break if player1.check_current_exit(space4) == "exit"
	elsif space_value == 4
		puts "You have found the exit!!!"
		puts "---------------------------------------------------"
		puts "Just kidding. It's a fake exit. Bombs inside the room. No one wins in this game."
		puts "---------------------------------------------------"
		puts "you are KILLED"
		break
	end
	
	puts "---------------------------------------------------"
end






# make sure to ask about the alternative solution when users can decide how many rooms there are




