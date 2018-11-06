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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
