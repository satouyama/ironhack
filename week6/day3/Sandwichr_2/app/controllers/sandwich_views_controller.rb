class SandwichViewsController < ApplicationController


  def index
    @sandwiches = Sandwich.all


    render "index"
  end


  def show
    sandwich_id = params[:id]
    @sandwich = Sandwich.find(sandwich_id)
    @ingredients = Ingredient.all
    
    render "show"

  end


end
