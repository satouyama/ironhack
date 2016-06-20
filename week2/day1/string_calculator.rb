# lib/string_calculator.rb

class StringCalculator
  def add(numbers_string)
    array = numbers_string.split(",")
    array.reduce(:+)
  end
end