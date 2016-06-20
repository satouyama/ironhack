class King < Chess
	def can_move? final_x, final_y
		super
		@x_diff <=1 && @y_diff <=1
	end
end