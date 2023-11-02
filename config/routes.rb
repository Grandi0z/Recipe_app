Rails.application.routes.draw do
  get 'public_recipes/index'
  get 'public_recipes/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root to: "users#show", as: :authenticated_root
    end

    unauthenticated do
      root to: "devise/sessions#new", as: :unauthenticated_root
    end
  end

  scope "/" do
    resources :users, only:[:show] do
      resources :foods, except: [:update, :show] do
        resources :recipe_foods
      end
      resources :recipes do
        resources :recipe_foods
      end
      resources :public_recipes, only:[:index, :show]
    end
  end  
  resources :public_recipes, only:[:index, :show]
end
