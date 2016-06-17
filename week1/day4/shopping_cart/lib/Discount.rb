require "time"

module Discount
	# IS THERE A EASY WAY TO DO THIS???!!!!!!!!!!!!!!!????????????!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	def apply_regular_discount
		saved_money = 0
		@items.each do |item,number|
			@price_list.each do |name,price|
				if item == :apple && (number / 2) >= 1 && name == :apple
					saved_money += number * price * 0.5
				end 
				if item == :orange &&  (number / 3 ) >= 1 && name == :orange
					saved_money += (number * price) / 3
				end
				if item == :grape && (number % 4) >= 1 && @items[:banana] >1 && name == :grape
					if number / 4 > @items[:banana]
						saved_money += @items[:banana] * @price_list[:banana]
					else
						saved_money += (number / 4) * @price_list[:banana]
					end
				end
			end
		end
		saved_money
	end

	def get_seasonal_price discount_code
		month_code = discount_code[0]
		@all_price_list[month_code]
	end

	

end