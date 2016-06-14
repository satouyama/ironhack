require_relative("lib/car.rb")

car1 = Car.new("biubiu",1000)
car1.make_noise

car2 = Car.new("watch out!",10)
car2.make_noise

Car.check_speed()
