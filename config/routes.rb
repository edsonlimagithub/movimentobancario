Movimentobancario::Application.routes.draw do
  resources :prazos

  resources :grupo_eventos

  resources :eventos

  resources :contas

  resources :lancamentos

  get "dashboard/index"

  root :to => 'dashboard#index'

  get "pages/index"

  devise_for :users
  
end
