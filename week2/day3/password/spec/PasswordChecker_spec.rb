require_relative("../lib/PasswordChecker.rb")

RSpec.describe PasswordChecker do
  
  let :checker do 
    PasswordChecker.new
  end

  it "returns true for password greater than 7" do
    expect(checker.check_length("678494573")).to eq true
  end

  it "return false when less than 7" do
    expect(checker.check_length("6783")).to eq false
  end


  it "returns true when 1 letter,number and symbol in password" do
    expect(checker.check_character("password")).to eq false
    expect(checker.check_character("1267**(@")).to eq false
    expect(checker.check_character("2323oijfdsa")).to eq false

    expect(checker.check_character("pass12^%")).to eq true
  end


  it "returns true when 1 letter is uppercase and one is lowercase" do
    expect(checker.check_case("password")).to eq false
    expect(checker.check_case("PASSWORD")).to eq false

    expect(checker.check_case("passWORD")).to eq true
  end

  it "returns true when name and domain are not password" do 
      expect(checker.check_email("rafal123","rafal@ironhack.com")).to eq false
      expect(checker.check_email("theironhack","rafal@ironhack.com")).to eq false

      expect(checker.check_email("passwordP","rafal@ironhack.com")).to eq true

  end

  it "returns true when all conditions passed" do
      expect(checker.check_password("passWord123(*&","rafal@ironhack.com")).to eq true
  end


end