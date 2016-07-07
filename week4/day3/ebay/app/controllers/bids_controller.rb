class BidsController < ApplicationController

  def create

    @bid_amount = params[:bid][:amount]
    @bidder_email = params[:bid][:bidder_email]

    @bid_product = Product.find(params[:product_id])
    @bid_product.bids.new(amount: @bid_amount, bidder_email: @bidder_email)
    @bid_product.save

    # render plain: Bid.all.inspect
    
    @bids_list = Bid.where(product_id: params[:product_id])



    


    # # # render plain: params.inspect 

    # # @located_bidder = User.find_by(email:@bidder_email)

    @product_id = params[:product_id]
    # # render plain: params.inspect
    @current_product = Product.find(@product_id)


    render "new"

  end
end
