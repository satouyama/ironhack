class SearchesController < ApplicationController


  def index
    render "index"
  end

  def find


    max_price = params[:price]

    @results_list = Concert.where("price <= ?", max_price)
    @cheapest = Concert.order("price DESC").last

    # render plain: @results_list.inspect
    render "find"


  end


end
