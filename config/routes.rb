Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root to: "users#index", as: :authenticated_root
    end

    unauthenticated do
      root to: "devise/sessions#new", as: :unauthenticated_root
    end
  end

  scope "/" do
    resources :users, only:[:index] do
      resources :foods do
        resources :recipe_foods
      end
      resources :recipes do
        resources :recipe_foods
      end
    end
  end  
end
