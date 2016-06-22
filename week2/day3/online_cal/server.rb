# server.rb
require "sinatra"
require "sinatra/reloader"
require "pry"
require_relative("lib/Calculator.rb")


enable(:sessions)

get "/" do
  "Welcome to the Online Calculator"
  erb(:home)
end

get "/session_test" do
  @current_session = session

  erb(:display_the_session)

end

get "/session_add/:value" do
  session[:new_session_value] = params["value"]

  
  redirect to ("/session_test")
end


post "/calculate" do
  operation = params[:operation]
  first = params[:first_number].to_f
  second = params[:second_number].to_f

  # binding.pry

  calculation1 = Calculator.new(first,second)

  case operation
  when "add"
    @display = calculation1.add
    erb(:calculate)
  when "substract"
    @display = calculation1.substract
    erb(:calculate)
  when "multiply"
    @display = calculation1.multiply
    erb(:calculate)
  when "divide"
    @display = calculation1.divide
    erb(:calculate)
  end

end

post "/save" do
  string = params[:saved]
  value = string[(string.index("=") + 1)..-1]
  @first = value.to_f

  # file = File.open("public/saveee.txt","w")
  # file.puts @first
  # file.close

  erb(:home2)

end



get "/add" do
  erb(:add)
end
get "/substract" do
  erb(:substract)
end
get "/multiply" do
  erb(:multiply)
end
get "/divide" do
  erb(:divide)
end


post "/calculate_add" do
  first = params[:first_number].to_f
  second = params[:second_number].to_f
  calculation1 = Calculator.new(first,second)

  @display = calculation1.add
  erb(:calculate_add)

end


post "/calculate_substract" do
  first = params[:first_number].to_f
  second = params[:second_number].to_f
  calculation1 = Calculator.new(first,second)

  @display = calculation1.substract
  erb(:calculate_substract)

end


post "/calculate_multiply" do
  first = params[:first_number].to_f
  second = params[:second_number].to_f
  calculation1 = Calculator.new(first,second)

  @display = calculation1.multiply
  erb(:calculate_multiply)

end


post "/calculate_divide" do
  first = params[:first_number].to_f
  second = params[:second_number].to_f
  calculation1 = Calculator.new(first,second)

  @display = calculation1.divide
  erb(:calculate_divide)

end
