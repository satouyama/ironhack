# server.rb

require "sinatra"





get "/" do
	erb(:home)
end 

get "/hi" do
  "Hello, world!"
end

get "/about" do
  @happy = "hohohohoho"
  erb(:about)
end

get "/recipe" do
  @ingredients = ["eggs", "red food coloring", "flour", "cocoa", "buttermilk", "sugar", "cream cheese"]
  @name = "Red Velvet Cake"

  erb(:recipe_page)
end


get "/users/:username" do
  @username = params

  erb(:user_profile)
end