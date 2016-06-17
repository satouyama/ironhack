class ShoppingCart
	#include Rename
	include Discount
	include DateNow
	attr_reader :price_list
	def initialize
		@items = {

		}

		@all_price_list = [
			{apple: 10,
			orange: 5,
			grape: 15,
			banana: 20,
			watermelon: 50},

			{apple: 10,
			orange: 2,
			grape: 15,
			banana: 20,
			watermelon: 50},

			{apple: 15,
			orange: 5,
			grape: 15,
			banana: 20,
			watermelon: 50},

			{apple: 12,
			orange: 5,
			grape: 15,
			banana: 21,
			watermelon: 50}
		]

		date_code = check_date
		discount_code = generate_discount_code(date_code)
		#puts "discount code is #{discount_code}"

		@price_list = get_seasonal_price(discount_code)
		#puts "weekday is #{discount_code[1]}"
		if discount_code[1] == 1
			#puts "Sunday condition satisfied!"
			@price_list[:watermelon] = 100
		end
		#puts "seasonal price is #{@price}"


	end

	def add_item_to_cart item
		if @items[item]
			@items[item] +=1
		else
			@items[item] = 1
		end

	end

	def show 
		puts "current cart content:"
		@items.each do |item,number|
			if number >1
				puts "#{number} #{item}s: #{ number * @price_list[item]}$"
			else 
				puts "#{number} #{item}: #{@price_list[item]}$"
			end
		end
	end

	def cost
		total = 0
		@items.each do |item,number|
			@price_list.each do |name,price|
				if item == name
					total += price * number
				end
			end
		end
		total
	end

end