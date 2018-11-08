Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:show] #totally independent
  resources :wallets do
    resources :offers, only: [:create]
  end

  resources :transactions, only: [:index, :create]
  resources :currencies, only: [:index, :show] #totally independent
  resources :offers, only: [:show, :index] do
    resources :transactions, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
