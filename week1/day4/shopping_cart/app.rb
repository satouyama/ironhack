#  Two main problems
# 1. Too many methods in the initialization for shopping cart 
#    Is this usually frowned upon?
# 2. easier way to apply discount rather than the tripple & conditions setting

require_relative("lib/Discount.rb")
require_relative("lib/Date.rb")
require_relative("lib/ShoppingCart.rb")
#require_relative("lib/Cashier.rb")



cart = ShoppingCart.new

cart.add_item_to_cart :apple
cart.add_item_to_cart :apple
cart.add_item_to_cart :apple
cart.add_item_to_cart :apple
cart.add_item_to_cart :apple
cart.add_item_to_cart :apple
cart.add_item_to_cart :apple
cart.add_item_to_cart :orange
cart.add_item_to_cart :orange
cart.add_item_to_cart :orange
cart.add_item_to_cart :banana
cart.add_item_to_cart :banana
cart.add_item_to_cart :grape
cart.add_item_to_cart :grape
cart.add_item_to_cart :grape
cart.add_item_to_cart :grape
cart.add_item_to_cart :grape
cart.add_item_to_cart :grape
cart.add_item_to_cart :grape
cart.add_item_to_cart :grape
cart.add_item_to_cart :grape
cart.add_item_to_cart :grape

# cashier1 = Cashier.new
# price_list = cashier1.check

puts "----------------"
cart.show
puts "----------------"
puts "----------------"

puts "seasonal price right now: #{cart.price_list}"
puts "----------------"

total_cost = cart.cost
puts "----------------"
puts "total cost before discount is #{total_cost}"
puts "----------------"

cost_after_regular_discount = total_cost - cart.apply_regular_discount
# cost_after_seasonal_discount = 
puts "----------------"
puts "cost after regular discount is #{cost_after_regular_discount}"
puts "----------------"
