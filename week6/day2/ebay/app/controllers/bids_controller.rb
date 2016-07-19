class BidsController < ApplicationController

  def create

    

    @bid_amount = params[:bid][:amount]
    @bidder_email = params[:bid][:bidder_email]

    @bid_product = Product.find(params[:product_id])
    @bid_product.bids.new(amount: @bid_amount, bidder_email: @bidder_email)

    @product_id = params[:product_id]
    # # render plain: params.inspect
    @current_product = Product.find(@product_id)

    @product_owner = User.find(@current_product.user_id)

    @old_bids_list = Bid.where(product_id: params[:product_id])
    @bids_list = @old_bids_list.order(amount: :desc)

    if User.exists?(email: @bidder_email) && check_same_user(@bidder_email, @product_owner.email)
        @bid_product.save
        render "products/show"
    else
        redirect_to :back
    end


    # render plain: Bid.all.inspect
    
    # # # render plain: params.inspect 

    # # @located_bidder = User.find_by(email:@bidder_email)


  end


  def check_same_user bidder_email, owner_email
    if bidder_email != owner_email
        return true
    end
  end




end
