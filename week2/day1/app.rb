# app.rb

require_relative("lib/string_calculator.rb")

the_calculator = StringCalculator.new

p the_calculator.add("") == 0

p the_calculator.add("6") == 6
p the_calculator.add("9") == 9

p the_calculator.add("5,7") == 12
p the_calculator.add("4,3") == 7