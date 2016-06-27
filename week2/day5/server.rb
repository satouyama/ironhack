
require_relative("lib/Movie.rb")

require "sinatra"
require "sinatra/reloader"
require "imdb"



get "/home" do
  erb(:home)
end


get "/loading" do   # transition page not working. socket error
  @name = params[:name]

  "Pls be patient. Loading........."

  redirect to("/search/#{@name}")
  # redirect to("/search?name=#{name}")

end

get "/search/:name" do


  key_word = params[:name]
  # puts "-------------if name is being sent =---------------------"
  # p key_word

  new_list = Movie.new
  @array_of_movies = new_list.get_final_list key_word
  @array_of_questions = new_list.get_questions_list

  puts "--------------------questions--------------------list"
  p @array_of_questions
  erb(:search_result)
end