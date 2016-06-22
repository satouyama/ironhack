class Calculator
  def initialize(first,second)
    @first = first
    @second = second
  end

  def add
    result = @first + @second
    "#{@first} + #{@second} = #{result}"
  end

  def substract
    result = @first - @second
    "#{@first} - #{@second} = #{result}"

  end

  def multiply
    result = @first * @second
    "#{@first} * #{@second} = #{result}"

  end

  def divide
    result = @first / @second
    "#{@first} / #{@second} = #{result}"
  end

end