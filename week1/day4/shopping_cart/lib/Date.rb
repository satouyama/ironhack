module DateNow

	def check_date
		current_time = Time.new
		wday = current_time.wday
		month = current_time.mon
		array1 = [month,wday]
	end

	def generate_discount_code array
		#puts "seasonal code is #{array}"
		array1 = [0,0]
		if array[0].between?(6,8)
			array1[0] = 1
		elsif array[0].between?(9,11)
			array1[0] = 2
		elsif [12,1,2].include?(array[0])
			array1[0] = 3
		end

		if array[1] == 7
			array1[1] = 1
		end
		array1
	end

end