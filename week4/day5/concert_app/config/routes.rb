Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :concerts do
    resources :comments
  end

  

  get "/searches/results" => "searches#find"

  resources :searches


  get "/top_10_popular" => "searches#popular"

  
end
