
require_relative("ford.rb")
require_relative("honda.rb")
require_relative("bmw.rb")
require_relative("count.rb")
require_relative("print.rb")


car1 = Ford.new(5,"honhon")
car2 = Honda.new(6,"haha")
car3 = Bmw.new(100,"huhu")

array1 = car1,car2,car3

count1 = Count.new(array1)
count1.count

print1 = Print.new(array1)
print1.print_all