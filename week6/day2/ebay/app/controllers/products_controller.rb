class ProductsController < ApplicationController

  def index 

    @current_user = User.find(params[:user_id])
    @current_products = @current_user.products


    # render plain: @current_products.inspect != nil  
    render "index"

  end

  def new

    @current_user = User.find(params[:user_id])
    @current_product = @current_user.products.new

    render "new"


  
  end


  def create 
    @current_user = User.find(params[:user_id])

    @current_product = @current_user.products.new(
          title: params[:product][:title],
          description: params[:product][:description],
          deadline: params[:product][:deadline],
      )


    # render plain: @current_product.inspect

    if @current_product.save
      redirect_to "/users/#{@current_user.id}/products"
    else
      render "new"
    end



  end

  def show


    
    @product_id = params[:id]
    @id = params[:user_id]
    # render plain: params.inspect

    @current_product = Product.find_by("id = ? AND user_id =?", @product_id, @id)

    @old_bids_list = @current_product.bids

    # render plain: @old_bids_list.inspect
    @bids_list = @old_bids_list.order(amount: :desc)

    render "show"

  end

end
