class Chess
	attr_accessor :start_x, :start_y, :color, :name
	def initialize start_x, start_y, color, name
		@start_x = start_x
		@start_y = start_y
		@color = color
		@x_diff
		@y_diff
		@name = name
	end
	def can_move? final_x, final_y

		@x_diff = (final_x - @start_x).abs
		@y_diff = (final_y - @start_y).abs
		#puts "haha"
	end
end