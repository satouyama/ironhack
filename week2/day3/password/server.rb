# server.rb
require "sinatra"
require "sinatra/reloader"
require "pry"
require_relative("lib/PasswordChecker.rb")

enable :sessions

get "/log_in" do 
  erb(:log_in)
end


post "/v" do
  username = params[:username]
  password = params[:password]

  checker = PasswordChecker.new
  if checker.check_password(password,username)
    redirect to("/congratulation")
  else
    redirect to("/log_in")
  end
  # "hello world" 

end


get "/congratulation" do
  erb(:congratulation)
end

