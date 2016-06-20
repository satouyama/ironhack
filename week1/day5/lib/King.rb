class King < Chess
	def can_move? final_x, final_y
		super
		if @x_diff <=1 && @y_diff <=1
			true
		else
			false
		end
	end
end