Movimentobancario::Application.routes.draw do
  get "dashboard/index"

  root :to => 'dashboard#index'

  get "pages/index"

  devise_for :users
  
end
