class SandwichesController < ApplicationController

before_action :authenticate_user!, only: :add_ingredient

def index
	sandwiches = Sandwich.all
	render json: sandwiches
end

def create
	
	sandwich = Sandwich.create(sandwich_params)
	render json: sandwich
end

def show
	sandwich = Sandwich.find_by(id: params[:id])
	ingredients = sandwich.ingredients

	response = {sandwich: sandwich, ingredients: ingredients}

	unless sandwich
		render json: {error:"sandwich not found"},status: 404
		return
	end
	render json: response
end

def update

	sandwich = Sandwich.find_by(id: params[:id])	
	unless sandwich
		render json: {error:"sandwich not found"},status: 404
		return
	end
	sandwich.update(sandwich_params)
	render json: sandwich
end


def destroy
	sandwich = Sandwich.find_by(id: params[:id])	
	unless sandwich
		render json: {error:"sandwich not found"},status: 404
		return
	end
	sandwich.destroy
	head :no_content
end


def add_ingredient
	# sandwich_id = params[:id]
	sandwich = Sandwich.find_by(id: params[:id])
	
	unless sandwich
		render json: {error:"sandwich not found"},status: 404
		return
	end

	# ingredient_id = params[:ingredient_id]
	ingredient = Ingredient.find_by(id: params[:ingredient_id])
	sandwich.ingredients.push(ingredient)
	# SandwichIngredient.create(sandwich_id:sandwich_id,ingredient_id:ingredient_id)
	ingredients = sandwich.ingredients
	response = {sandwich: sandwich, ingredients: ingredients}

	render json: response
end

private

def sandwich_params
	params.require(:sandwich).permit(:name, :bread_type)
end


end
