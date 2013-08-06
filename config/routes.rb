Movimentobancario::Application.routes.draw do
  resources :produtos

  resources :prazos

  resources :grupo_eventos

  resources :eventos

  resources :contas

  resources :lancamentos

  get "dashboard/index"

  root :to => 'dashboard#index'

  get "pages/index"

  devise_for :users
  #espera arquivo sitef
  match "/importacao/sitef" => "importacao#sitef"
  #exibe registro do arquivo sitef
  match "/importacao/sitefExibirRegistros" => "importacao#sitefExibirRegistros"
  #processa arquivo sitef: salva registro sitef e cria lançamentos
  match "/importacao/processaRegistrosSitef" => "importacao#processaRegistrosSitef"


  
end
