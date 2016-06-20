module Input
	def ask_for_ori

		puts "-------------------------"
		puts "-------------------------"

		if @turn ==0
			puts "White chess turn"
		else 
			puts "Black chess turn"
		end

		puts "Input the coordinates of the piece you want to move"
		puts "-------------------------"
		puts "------------------------"
		input_cor = gets.chomp
	end

	def ask_for_des
		puts "-------------"
		puts "Input the coordinates of the destination"
		input_des = gets.chomp
	end


	def check_board_valid(input_cor, des = 0) # whether input is within the range
		array1 = input_cor.split("") 

		if des == 0
			if (@grid[8-(array1[1].to_i)][(array1[0].to_i)-1].name =~ /[W]/ ) && @turn == 0
				puts "first con"
				true
			elsif (@grid[8-(array1[1].to_i)][(array1[0].to_i)-1].name =~ /[B]/) && @turn ==1
				puts "second con"
				true
			else
				puts "It's not your turn yet piece of shit"
				return false
			end
		end
			

		#puts @grid[8-(array1[1].to_i)][(array1[0].to_i)-1]
		 if (1..8).include?(array1[0].to_i) && (1..8).include?(array1[1].to_i) && array1.length ==2
		 	if @grid[8-(array1[1].to_i)][(array1[0].to_i)-1] == "00" && des ==0
		 		puts "This slot has an empty piece.pls try again"
		 		return false
		 	end
		 	return true

		 else
		 	return false
		 end
		 	
	end

	def convert input_cor
		start_x = input_cor.split("")[0].to_i
		start_y = input_cor.split("")[1].to_i

		# obtaining x,y index from the string input
		index_start_x = 8 - start_y
		#puts "after math equal #{index_start_x}"

		index_start_y = start_x -1
		array1 = start_x,start_y,index_start_x,index_start_y
		#p array1
		#array1
	end

end