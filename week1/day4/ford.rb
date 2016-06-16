class Ford
	def initialize(numbers,noise)
		@numbers = numbers
		@noise = noise
	end
	def count_wheels
		@numbers
	end
	def make_noise
		puts @noise
	end

end