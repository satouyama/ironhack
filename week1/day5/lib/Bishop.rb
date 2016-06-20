class Bishop < Chess
	def can_move? final_x, final_y
		super
		if @x_diff == @y_diff 
			true
		else
			false
		end
	end
end