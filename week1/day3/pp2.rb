require "imdb"

file1 = File.open("movies.txt", "r")
contents = file1.readlines
#puts contents.class
#puts contents.length

movie_ratings = {
	"10" => [],
	"9" => [],
	"8" => [],
	"7" => [],
	"6" => [],
	"5" => [],
	"4" => [],
	"3" => [],
	"2" => [],
	"1" => []
}

#puts movie_ratings
contents.each do |z|
	the_search = Imdb::Search.new(z)
	first_result =  the_search.movies[0].rating.round
#	puts first_result
	j=0
	movie_ratings.each do |x,y|
		if first_result >= x.to_i
			y.push("|#")
		else
			y.push("| ")
		end
	end 
end
=begin
movie_ratings.each do |x,y|
	
end
=end
for i in 0...movie_ratings.length
	string = movie_ratings.values[i].join()
	puts "#{string}|"
#	print "#{movie_ratings.values[i]}\n".
end

puts "_ _ _ _ _ _ _ _ _ _"

contents.each_index do |x|
	print "|#{x+1}"
	if x == contents.length - 1
		print "|"
	end
end
puts "          "
puts "_ _ _ _ _ _ _ _ _ _ _"

contents.each_index do |x|
	puts "#{x+1}. #{contents[x]}"
end




=begin
require "imdb"

the_search = Imdb::Search.new("Captain America: Civil War")

first_result =  the_search.movies[0]

puts first_result.rating.round



=end