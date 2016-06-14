# collections

class Home
  attr_reader(:name, :city, :capacity, :price)

  def initialize(name, city, capacity, price)
    @name = name
    @city = city
    @capacity = capacity
    @price = price
  end
end


homes = [
  Home.new("Nizar's place", "San Juan", 2, 42),
  Home.new("Fernando's place", "Seville", 5, 47),
  Home.new("Josh's place", "Pittsburgh", 3, 41),
  Home.new("Gonzalo's place", "Málaga", 2, 45),
  Home.new("Ariel's place", "San Juan", 4, 49),
  Home.new("Jojo's place", "Miami", 4, 100),
  Home.new("Sebastian's place", "Miami", 10, 100),
  Home.new("Nick's place", "Boston", 2, 60),
  Home.new("Grey's place", "New York", 1, 150),
  Home.new("Carol's place", "Orange County", 4, 55),
  Home.new("Daniel's place", "Las Vegas", 45, 100)
]

def array_printer(array)
	array.each do |element|
		puts %Q(#{element.name} in #{element.city})
		puts "Price: #{element.price} a night for #{element.capacity}"
	end
end

puts "How do you want the list to be sorted? price or capacity?"

sorting_way = gets.chomp

while sorting_way !="price" && sorting_way != "capacity"
	puts "plz input 'price' or 'capacity'"
	sorting_way = gets.chomp
end

sorted_homes = homes.sort_by{|element| element.send(sorting_way) }
#array_printer(sorted_homes)


filtered_homes = homes.select {|x| x.city =="Miami"}
#array_printer(filtered_homes)


price_list = homes.map { |element| element.price }
average = price_list.reduce(:+) / price_list.length

#puts average

puts "So what's your budget? Places under?"
ideal_price = gets.chomp.to_i

ideal_homes = homes.find_all{|x| x.price <= ideal_price}
array_printer(ideal_homes)


#price = homes.map do |element|
#	element.price
#end

#average = price.reduce(:+) / price.length
#puts average