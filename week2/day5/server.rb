
require_relative("lib/Movie.rb")

require "sinatra"
require "imdb"



get "/home" do
  erb(:home)
end


get "/search" do
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