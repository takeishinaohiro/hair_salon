Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index,:new,:show,:create, :edit] do
    collection do
      get 'search'
    end
  end
  root 'hairs#index'
  resources :hairs, only: [:index,:create,:new,] do
    member do
      post 'new', to: 'hairs#new'
    end
    collection do
      get 'karute', to: 'hairs#karute'
    end
  end
end
