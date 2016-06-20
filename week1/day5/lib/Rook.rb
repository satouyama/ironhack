class Rook < Chess
	def can_move? final_x, final_y
		super
		if @start_x == final_x || @start_y == final_y
			true
		else
			false
		end
	end
end