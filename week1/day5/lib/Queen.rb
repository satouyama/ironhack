class Queen < Chess
	def can_move? final_x, final_y
		super
		if final_x == @start_x || final_y == @start_y
			true
		elsif @x_diff == @y_diff
			true
		else
			false
		end	
	end
end