Rails.application.routes.draw do
  
  resources :sandwiches, only: [:index, :show], controller:   "sandwich_views"
  scope "/api" do
    resources :ingredients, only:[:create,:destroy,:show]
    resources :sandwiches, except:[:new,:edit]
    post "/sandwiches/:id/ingredients/add" => "sandwiches#add_ingredient"
  end

  # post '/sandwiches/:id/ingredients/add', to: 'sandwiches#add_ingredient'

  # resources :ingredients, only:[:create,:destroy,:show]
  # resources :sandwiches, except:[:new,:edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
