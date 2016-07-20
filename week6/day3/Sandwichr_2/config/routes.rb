Rails.application.routes.draw do
  
  get "/" => "sandwich_views#index"  
  devise_for :users
  resources :sandwiches, only: [:index, :show], controller:   "sandwich_views"
  
  scope "/api" do
    resources :ingredients, only:[:create,:destroy,:show]
    resources :sandwiches, except:[:new,:edit]
    post "/sandwiches/:id/ingredients/add" => "sandwiches#add_ingredient"
  end

end

