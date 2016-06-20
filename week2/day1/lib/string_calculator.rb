# lib/string_calculator.rb

class StringCalculator
  def add(numbers_string)
    check_input numbers_string
    array = numbers_string.split(/\D/)
    #puts array.length
    array = [0] if array == []
    
    array1 = array.map do |variable|
      variable.to_i
    end

    array1.reduce(:+)
  end

  def check_input input
    input.gsub(/[^0-9,]+/,"")
  end

end

