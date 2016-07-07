class BidsController < ApplicationController

  def create

    @bid_amount = params[:bid][:amount]
    @bidder_email = params[:bid][:bidder_email]

    @bid_product = Product.find(params[:product_id])
    @bid_product.bids.new(amount: @bid_amount, bidder_email: @bidder_email)
    
    if User.exists?(email: @bidder_email)
        @bid_product.save
    end


    # render plain: Bid.all.inspect
    
    @old_bids_list = Bid.where(product_id: params[:product_id])
    @bids_list = @old_bids_list.order(:amount)


    


    # # # render plain: params.inspect 

    # # @located_bidder = User.find_by(email:@bidder_email)

    @product_id = params[:product_id]
    # # render plain: params.inspect
    @current_product = Product.find(@product_id)


    render "products/show"

  end
end
