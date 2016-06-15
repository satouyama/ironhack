class Payroll
    def initialize(employees)
        @employees = employees
    end

    def notify_employee
          #email them
          @employees.each do |element|
          	puts "hey #{element.name} we sent a message to #{element.email} about your bank account"
          end
  	end
	def pay_employees
	      # Should output how much we're paying each employee for this week and the total amount spent on payroll this week. 
	      total_salary = 0
	      @employees.each do |element|

	      	puts "This is #{element.name}'s salary: $#{element.calculate_salary}"
	      	total_salary += element.calculate_salary
	      end
	      taxes = total_salary *0.18
	      total_salary = taxes + total_salary
	      puts " $ #{total_salary}"	
	end
end

