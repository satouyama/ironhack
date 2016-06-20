class Knight < Chess
	def can_move? final_x, final_y
		super
		if @x_diff ==2 || @y_diff ==2
			if (@x_diff-@y_diff).abs == 1
				true
			else
				false
			end
		else
			false
		end
	end
end