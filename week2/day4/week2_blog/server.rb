# ask about the space!!!!!

require_relative("lib/post.rb")
require_relative("lib/sponsored.rb")
require_relative("lib/blog.rb")

require 'colorize'
require "sinatra"

enable :sessions


blog = Blog.new
blog.add_post Post.new("Let me tell you a joke",Date.new(2001,2,3),"abcdefg","happy","dead man")
blog.add_post SponsoredPost.new("..........",Date.new(2003,3,5),"hijklmn","happy","dead man")
blog.add_post Post.new("Your mom",Date.new(1998,3,5),"opqrstu","happy","dead man")
# blog.add_post Post.new("1", "05/15/18","abcdefg")
# blog.add_post SponsoredPost.new("2","06/15/17","hijklmn")
# blog.add_post Post.new("3","07/15/16","opqrstu")
# blog.add_post Post.new("4", "05/15/15","abcdefg")
# blog.add_post SponsoredPost.new("5","06/15/14","hijklmn")
# blog.add_post Post.new("6","07/15/13","opqrstu")
# blog.add_post Post.new("7", "05/15/12","abcdefg")
# blog.add_post SponsoredPost.new("8","06/15/11","hijklmn")
# blog.add_post Post.new("9","07/15/10","opqrstu")

# blog.publish_front_page

# before "/home/?" do
#   params[:page] ||= 1
# end

  
get "/home/?:page?" do 

  params[:page] = 1 unless params[:page]

  destination_page = params[:page].to_i
  
  overall_page_numbers = session[:page]

  @posts = blog.return_specific_page_content destination_page # test 1


  @page = overall_page_numbers.to_i
  puts "-------------page number=------------------------------------"
  p @page
   puts "-------------destination=------------------------------------"
  p destination_page
  puts "------------destination=-----------------------------------"
  # p provided_page

  erb(:home)
end

get "/latest_posts" do
  # redirected from home.erb
  @posts = blog.latest_posts


  redirect to("/home")
end

get "/oldest_posts" do
  @posts = blog.oldest_posts


  redirect to("/home")
end

get "/edit/:index" do
 
  @index = params[:index].to_i
  @item = blog.posts[@index]

  puts "-----------------------index after reaching edit page-----------------"
  p @index
  p @item


  erb(:history_post)
  

end

# get "/history_post" do

#   erb(:history_post)

# end

get "/home/details/:index" do
  @index = params[:index].to_i
  @item = blog.posts[@index]

  puts "------------------index after clicking into details---------------"
  p @index

  erb(:details)

end

get "/new_post" do

  erb(:page_forms)
end

post "/create_page" do
  process = params[:process]
  title = params[:title]
  text = params[:text]
  category = params[:category]
  author = params[:author]
  puts "--------------------text value received------------------------"
  p text
  time = Date.parse(Time.now.to_s)
  

  blog.update(title,time,text,category,author,process)

  # if the post number is greater than 3
  # add a new page. 
  page = blog.check_pages

  session[:page] = page
  # p blog.posts

  redirect to("/home/#{page}")
end

