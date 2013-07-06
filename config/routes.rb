Movimentobancario::Application.routes.draw do
  resources :lancamentos

  get "dashboard/index"

  root :to => 'dashboard#index'

  get "pages/index"

  devise_for :users
  
end
