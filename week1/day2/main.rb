require_relative("lib/car.rb")
require_relative("lib/lightspeedcar.rb")

=begin
car1 = Car.new("biubiu",1000)
car1.make_noise

car2 = Car.new("watch out!",10)
car2.make_noise

Car.check_speed()

car1.travel("Venice")
car1.travel("Egypt")

puts car1.cities
=end

lightcar1 = Lightspeedcar.new("hhoohho",20)
lightcar1.make_noise



