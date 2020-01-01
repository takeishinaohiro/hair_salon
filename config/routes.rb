Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index,:new,:show]
  root 'hairs#index'
  resources :hairs, only: [:index] do
    member do
      post 'new', to: 'hairs#new'
    end
  end
end
