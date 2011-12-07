ActionController::Routing::Routes.draw do |map|
  map.resources :configuracaos
  map.resources :importar
  map.resources :emprestimos
  map.resources :itens_emprestimos
  map.resources :funcionarios
  map.resources :tipos
  map.resources :unidades
  map.resources :musicas
  map.resources :autores
  map.resources :itens_assuntos
  map.resources :assuntos
  map.resources :jogos
  map.resources :periodicos
  map.resources :mapas
  map.resources :mapas
  map.resources :dicionario_enciclopedias
  map.resources :livros
  map.resources :audio_visuais

  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'

  map.resources :users
  map.resource :session

  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.resource :password
  map.reset_password '/reset_password/:id', :controller => 'passwords', :action => 'edit'
  map.resources :users

  map.consultaDic '/consultaDic', :controller => 'dicionario_enciclopedias', :action => 'consultaDic'
  map.consultaLiv '/consultaLiv', :controller => 'livros', :action => 'consultaLiv'
  map.consultaJog '/consultajog', :controller => 'jogos', :action => 'consultaJog'

  map.resource :session
  map.resources :editoras
  map.resources :areas
  map.resources :localizacoes
  map.resources :identificacaos

  map.home '', :controller => 'home', :action => 'index'
  map.root :controller => "home"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
