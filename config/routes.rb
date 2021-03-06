Movimentobancario::Application.routes.draw do

  devise_for :views

  resources :produtos

  resources :prazos

  resources :grupo_eventos

  resources :eventos

  resources :contas

  resources :lancamentos
  #alterar status de confirmação do lançamento
  match "/lancamento/confirmado" => "lancamentos#confirmado"
  #filtro para listagem de lançamentos
  match "/lancamento/filtro" => "lancamentos#filtro"
  #apagar lançamento
  match "/lancamento/apagar_lancamento" => "lancamentos#apagar_lancamento"

  get "dashboard/index"

  root :to => 'dashboard#index'

  get "pages/index"

  devise_for :user
  #espera arquivo sitef
  match "/importacao/sitef" => "importacao#sitef"
  #espera arquivo softawy
  match "/importacao/softway" => "importacao#softway"
  #exibe registro do arquivo sitef
  match "/importacao/sitefExibirRegistros" => "importacao#sitefExibirRegistros"
  #processa arquivo sitef: salva registro sitef e cria lançamentos
  match "/importacao/processaRegistrosSitef" => "importacao#processaRegistrosSitef"


  
end
