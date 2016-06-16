class Count
	def initialize(array)
		@array = array
	end

	def count 
		total = @array.reduce(0) do |sum,a|
			sum + (a.count_wheels)
		end
		puts total
	end
end