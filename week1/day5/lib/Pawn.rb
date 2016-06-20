class Pawn < Chess
	def initialize start_x, start_y, color, name
		super
		@first_move = true
	end
	def can_move? final_x,final_y
		@y_diff = final_y - @start_y
		#puts "final y #{final_y}"
		#puts "start_y #{@start_y}"
		puts @y_diff

		if @start_x != final_x
			puts "first"
			false
		elsif @y_diff == 1 && @color == "white"
			puts " second condition passed"
			true
		elsif @y_diff == -1 && @color == "black"
			puts "third condition passed"
			true
		elsif @y_diff == 2 && @first_move && @color == "white"
			true
		elsif @y_diff == -2 && @first_move && @color == "black"
			true
		else 
			puts " final"
			false
		end
	end
end