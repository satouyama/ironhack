
class Employee
    attr_accessor :name, :email
    def initialize(name, email)
      @name = name
      @email = email
#      puts "haha"
    end
end

#============================================

require_relative("three_employees.rb")
require_relative("payroll.rb")


josh = HourlyEmployee.new('Josh', 'nachoemail@example.com', 35, 50)
nizar = SalariedEmployee.new('Nizar', 'starcraftrulez@gmail.com', 1000000)
ted = MultiPaymentEmployee.new('Ted', 'fortranr0x@gmail.com', 60000, 275, 55)
andres = HourlyEmployee.new("Andres","whatever@gmail.com",40,15)
weili = HourlyEmployee.new("WeiLi","haha@gmail.com",10,15)

employees = [josh, nizar, ted, andres, weili]
payroll = Payroll.new(employees)
payroll.pay_employees
payroll.notify_employee

