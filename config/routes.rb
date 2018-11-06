Rails.application.routes.draw do
  get 'users/show'
  get 'wallets/index'
  get 'wallets/show'
  get 'wallets/new'
  get 'wallets/create'
  get 'wallets/edit'
  get 'wallets/update'
  get 'wallets/destroy'
  get 'offers/index'
  get 'offers/show'
  get 'offers/new'
  get 'offers/create'
  get 'offers/edit'
  get 'offers/update'
  get 'offers/destroy'
  get 'currencies/index'
  get 'currencies/show'
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:show] do #totally independent
    resources :wallets #nested in users
  end
  resources :currencies, only: [:index, :show] #totally independent
  resources :offers, only: [:show, :index] #MAYBE INDEPENDENT
  #resources :transactions Do transactions controller LATER.
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
