class CarDealer
	def initialize inventory 
		@inventory = inventory
	end

	def cars car_brand 
		puts @inventory[car_brand]
	end

	def print_all
		@inventory.each do |x,y|
			print "#{x}:"
			y.each do |a,b|
				print "#{b[:model]} "
			end
			puts "      "
		end
	end

end

car_inventory = {
	Honda: {
		2012 => {
			price: 10000,
			model: "Fit"
		},
		2015 => {
			price: 50000,
			model: "Haha"
		}
	},
	Ford: {
		2010 => {
			price: 500,
			model: "heihei"
		}
	},
}

car_dealer = CarDealer.new(car_inventory)
car_dealer.cars :Honda
car_dealer.print_all





