class Blog
	def initialize
		@container = []
	end
	def publish_front_page
		s_index = 0
		e_index = 2
		pages = check_pages
		current_page = 1



		loop do 
			if current_page % 2 == 1
				color = "red"
			else
				color = "green"
			end

			(s_index..e_index).each do |element|
			if @container[element] != nil	
				puts @container[element].title.send(color)
				puts "***********"
				puts @container[element].text.send(color)
				puts "------------"
				puts "            "
			end
			end
			pages.times do |x| 
				if (x+1) == current_page
					print (x+1).to_s.red
				else
					print x+1
				end
			end
			puts "             "
			end_page = (pages-1) *3
			case s_index
				when 0
					puts "next"
				when end_page
					puts "previous"
				else
					puts "<previous    next>"
			end
			puts "                      "
			puts "next or previous page?"
			input = gets.chomp
			while input != "next" && input != "previous" && input != "exit"
				puts "plz input next or preivous"
				input = gets.chomp
			end

			if input =="next"
					current_page +=1
					s_index += 3
					e_index += 3
			elsif input =="previous"
					current_page -=1
					s_index -= 3
					e_index -= 3
			end

			break if input == "exit"
		end


	end
	def add_post(post)
		@container << post
	end
	def check_pages
		if @container.length % 3 != 0
			pages = @container.length / 3 +1
		else
			pages = @container.length / 3 # without the space it messed up 
		end
		pages
	end

end