# ask about the space!!!!!
require_relative("lib/post.rb")
require_relative("lib/sponsored.rb")
require 'colorize'
require_relative("lib/blog.rb")

blog = Blog.new
blog.add_post Post.new("-2", "05/15/21","abcdefg")
blog.add_post SponsoredPost.new("-1","06/15/20","hijklmn")
blog.add_post Post.new("0","07/15/19","opqrstu")
blog.add_post Post.new("1", "05/15/18","abcdefg")
blog.add_post SponsoredPost.new("2","06/15/17","hijklmn")
blog.add_post Post.new("3","07/15/16","opqrstu")
blog.add_post Post.new("4", "05/15/15","abcdefg")
blog.add_post SponsoredPost.new("5","06/15/14","hijklmn")
blog.add_post Post.new("6","07/15/13","opqrstu")
blog.add_post Post.new("7", "05/15/12","abcdefg")
blog.add_post SponsoredPost.new("8","06/15/11","hijklmn")
#blog.add_post Post.new("9","07/15/10","opqrstu")

blog.publish_front_page


