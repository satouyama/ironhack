


Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get "/" => "visitors#home", as: :home
  get "/text_inspections/new" => "text_inspections#new"

  post "/text_inspections" => "text_inspections#create"

  get "/asciis/new" => "asciis#new"
  post "/asciis" => "asciis#create"


  get "/text_generators/new" => "text_generators#new", as: :generator
  post "/text_generators" => "text_generators#create"

end
