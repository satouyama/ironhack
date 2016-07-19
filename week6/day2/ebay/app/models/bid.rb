class Bid < ApplicationRecord
  belongs_to :product

  validates :amount, numericality: true

  validate :amount_higher_than_minimum
  validate :amount_higher_than_previous_highest

  def amount_higher_than_minimum
    # puts "------------------------------I just want to find you --------------------------------------"
    # puts "------------------------------I just want to find you --------------------------------------"

    # puts "------------------------------I just want to find you --------------------------------------"

    # puts "------------------------------I just want to find you --------------------------------------"

    # p product_id
    # p amount

    # puts "------------------------------I just want to find you --------------------------------------"
    # puts "------------------------------I just want to find you --------------------------------------"

    # puts "------------------------------I just want to find you --------------------------------------"

    # puts "------------------------------I just want to find you --------------------------------------"

    # @product_id = params[:product_id]
    product_for_this_bid = Product.find(product_id)
    minimum = product_for_this_bid.minimum
    if amount > minimum
      return true
    else
      errors.add(:amount, "must be higher than minimum bid")
    end

  end


  def amount_higher_than_previous_highest
    bid_product_id = product_id
    bid_for_this_product = Bid.where("product_id = ?", bid_product_id)
    if bid_for_this_product != []

      highest_bid = bid_for_this_product.order("amount DESC").first.amount
    end
    
    product_for_this_bid = Product.find(product_id)
    minimum = product_for_this_bid.minimum
   
    # puts "------------------------------I just want to find you --------------------------------------"
    # puts "------------------------------I just want to find you --------------------------------------"

    # puts "------------------------------I just want to find you --------------------------------------"

    # puts "------------------------------I just want to find you --------------------------------------"

    # # p highest_bid
    # p product_id
    # p bid_product_id
    # p bid_for_this_product
    # p highest_bid
    # p amount

    # puts "------------------------------I just want to find you --------------------------------------"
    # puts "------------------------------I just want to find you --------------------------------------"

    # puts "------------------------------I just want to find you --------------------------------------"

    # puts "------------------------------I just want to find you --------------------------------------"


    if amount > (highest_bid || minimum)
      return true
    else
      errors.add(:amount, "must be higher than highest bid")
    end

  end

  # validates :bidder_email, uniqueness:true

  # , if: :same_amount?

  # def same_amount?


  # end

  
end
