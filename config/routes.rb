Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index,:new,:show,:create, :edit] do
    collection do
      get 'search'
    end
    member do
      get 'open', to: 'users#open'
    end
  end
  root 'hairs#index'
  get     'login',   to: 'sessions#login'
  post    'login',   to: 'sessions#login'
  post    'logout',  to: 'sessions#destroy'
  

  resources :hairs, only: [:create] do
    member do
      get 'new', to: 'hairs#new'
    end
    collection do
      get 'karute', to: 'hairs#karute'
    end
  end
end
