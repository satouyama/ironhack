class Print
	def initialize(array)
		@array = array
	end
	def print_all
		@array.each do |variable|
			variable.make_noise
		end
	end
end