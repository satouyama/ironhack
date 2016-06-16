# app.rb
require_relative("lib/user_authentication.rb")
require_relative("lib/text_processor.rb")

puts "plase log into this awesome word processing program."

puts ""
puts "Username: "
username = gets.chomp

puts ""
puts "Password: "
password = gets.chomp

attempt1 = UserAuthentication.new(username,password)

if attempt1.check_input
	puts""
	puts "Hello! #{username}!"

	puts "Enter some text so we can process it!"
	text = gets.chomp

	process1 = TextProcessor.new(text)
	result = process1.count_words
	puts ""
	puts "You text has #{result} word in it"

else
	puts ""
	puts "INCORRECT CREDENTIALS.GET THE F OUT OF HERE"
end
