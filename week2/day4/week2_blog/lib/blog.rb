class Blog
	attr_reader :posts
	def initialize
		@posts = []
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
			if @posts[element] != nil	
				puts @posts[element].title.send(color)
				puts "***********"
				puts @posts[element].text.send(color)
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

	def return_specific_page_content page_number
		start_index = (page_number - 1) * 3
		end_index = (page_number - 1) * 3 + 2
		if @posts[end_index]
			specific_page_posts = @posts[start_index..-1] 
		else 
			specific_page_posts = @posts[start_index..end_index]
		end
		specific_page_posts
	end

	def add_post(post)
		@posts << post
	end
	def check_pages
		if @posts.length % 3 != 0
			pages = @posts.length / 3 +1
		else
			pages = @posts.length / 3 # without the space it messed up 
		end
		pages
	end


	def latest_posts
		@posts.sort_by! do |element|
			element.date
		end
		@posts.reverse!
	end
	def oldest_posts
		@posts.sort_by! do |element|
			element.date
		end
		@posts
	end

	def update(title,time,text,category,author,process)
		if process =~ /update/
			index = (process =~ /update/)
			length = "update".length
			final_index = index+length
			search_index = process[final_index].to_i
			@posts[search_index].title = title
			@posts[search_index].text = text
			@posts[search_index].category = category
			@posts[search_index].author = author
			@posts[search_index].date = Time.new


		elsif process == "create"
			@posts << Post.new(title,time,text,category,author)

		end


	end

end