# spec/string_calculator_spec.rb

require_relative("../lib/string_calculator.rb")


RSpec.describe StringCalculator do
  let :the_calculator do
    the_calculator = StringCalculator.new
  end

  context "give empty" do
    it "returns 0 " do
      #test code
      expect(the_calculator.add("")).to eq 0
    end
  end

  context "given single number" do
    it "returns the number 6 when given 6" do
      expect(the_calculator.add("6")).to eq 6
    end
    it "returns the number 9 when given 9" do
      expect(the_calculator.add("9")).to eq 9
    end
  end

  context "given 2 digits" do 
    it "returns 12 when given 7,5" do
      expect(the_calculator.add("7,5")).to eq 12
    end
    it "returns 7 when given 4,3" do
      expect(the_calculator.add("4,3")).to eq 7
    end
    it "returns 7 when given 4&3" do
      expect(the_calculator.add("4&3")).to eq 7
    end
  end

  context "given 3 digits" do
    it "returns 22 when given 7,5,10" do
      expect(the_calculator.add("7,5,10")).to eq 22
    end
    it "returns 27 when given 4,3,20" do
      expect(the_calculator.add("4,3,20")).to eq 27
    end
  end

  context "given different separating characters" do
    it "returns 22 when given 7%5,10" do
      expect(the_calculator.add("7%5,10")).to eq 22
    end
    it "returns 27 when given 4#3(20" do
      expect(the_calculator.add("4#3(20")).to eq 27
    end
  end
end


  # 7&5  ->  12
  # 4&3  ->  7

  # 7,5,10  ->  22
  # 4,3,20  ->  27

  # 7&5,10  ->  22
  # 4,3&20  ->  27


  


# the_calculator = StringCalculator.new

# p the_calculator.add("") == 0

# p the_calculator.add("6") == 6
# p the_calculator.add("9Y$%^,8") == 9

# p the_calculator.add("5,7") == 12
# p the_calculator.add("4,3") == 7