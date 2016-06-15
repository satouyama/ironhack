class HourlyEmployee < Employee
    attr_accessor :salary
    def initialize(name, email, hourly_rate, hours_worked)
#        @name = name
#        @email = email
        @hourly_rate = hourly_rate
        @hours_worked = hours_worked
#        @salary = nil
    end

    def calculate_salary
      #returns the hours worked * hourly_rate
      salary = @hourly_rate * @hours_worked
    end
end

class SalariedEmployee < Employee
	attr_accessor :salary
    def initialize(name, email, annual_salary)
        @name = name
        @email = email
        @annual_salary = annual_salary
#        @salary = nil

    end

    def calculate_salary
      #returns the hours worked * hourly_rate
      salary = @annual_salary / 52

    end
end

class MultiPaymentEmployee < Employee
    attr_accessor :salary
    def initialize(name, email, annual_salary,hourly_rate,hours_worked)
        @name = name
        @email = email
        @annual_salary = annual_salary
        @hourly_rate = hourly_rate
        @hours_worked = hours_worked
      #  @salary = nil

    end

    def calculate_salary
      #returns the hours worked * hourly_rate
      additional_hours = @hours_worked - 40
      weekly_salary = @annual_salary / 52
      salary = weekly_salary + (@hourly_rate * additional_hours)
    end
end
