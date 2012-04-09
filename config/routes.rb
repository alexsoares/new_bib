ActionController::Routing::Routes.draw do |map|
  map.resources :tombos,:only => [:index], :collection => {:usuario => :get, :livros_diarios => :get,:de_diarios => :get}

  map.resources :logs


  map.resources :consultas ,:only => [:index], :collection => {:gerar_tombos => :get,:criar_consulta => :get, :lista_tombo => :get}
  map.resources :midias, :collection => {:midias_cadastradas => :get}

  map.resources :musicas
  map.resources :cantores
  map.resources :generos
  map.resources :roles_users, :collection => {:lista_users => :get}
  map.resources :configuracoes
  map.resources :importar
  map.resources :emprestimos, :collection => {:funcionario => :get, :alunos => :get,:classe => :get, :dpu => :get, :busca => :get}
  map.resources :itens_emprestimos
  map.resources :funcionarios
  map.resources :tipos
  map.resources :unidades
  map.resources :musicas
  map.resources :autores
  map.resources :itens_assuntos
  map.resources :assuntos
  map.resources :jogos, :collection => {:jogos_cadastrados => :get}
  map.resources :periodicos
  map.resources :mapas
  map.resources :mapas
  map.resources :dicionario_enciclopedias, :collection => {:de_cadastrados => :get}
  map.resources :livros,:collection => {:livros_cadastrados => :get}

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
  map.resumo '/resumo/:livro', :controller => 'livros', :action => 'resumo'

  map.consultaDic '/consultaDic', :controller => 'dicionario_enciclopedias', :action => 'consultaDic'
  map.consultaLiv '/consultaLiv', :controller => 'livros', :action => 'consultaLiv'
  map.consultaJog '/consultaJog', :controller => 'jogos', :action => 'consultaJog'
  map.consultaMap '/consultaMap', :controller => 'mapas', :action => 'consultaMap'
  map.consultaAut '/consultaAut', :controller => 'autores', :action => 'consultaAut'
  map.consultaAutLiv '/consultaAutLiv', :controller => 'autores', :action => 'consultaAutLiv'
  map.consultaAre '/consultaAre', :controller => 'areas', :action => 'consultaAre'
  map.consultaAreLiv '/consultaAreLiv', :controller => 'areas', :action => 'consultaAreLiv'
  map.consultaEdi '/consultaEdi', :controller => 'editoras', :action => 'consultaEdi'
  map.consultaEdiLiv '/consultaEdiLiv', :controller => 'editoras', :action => 'consultaEdiLiv'
  map.consultaTit '/consultaTit', :controller => 'identificacaos', :action => 'consultaTit'
  map.consultaGen '/consultaGen', :controller => 'generos', :action => 'consultaGen'
  map.consultaCan '/consultaCan', :controller => 'cantores', :action => 'consultaCan'
  map.consultaCanMus '/consultaCanMus', :controller => 'cantores', :action => 'consultaCanMus'
  map.consultaMus '/consultaMus', :controller => 'musicas', :action => 'consultaMus'
  map.consultaAud '/consultaAud', :controller => 'audio_visuais', :action => 'consultaAud'
  map.consultaMid '/consultaMid', :controller => 'midias', :action => 'consultaMid'
  map.consultaAsu '/consultaAsu', :controller => 'assuntos', :action => 'consultaAsu'
  map.consultaAsuLiv '/consultaAsuLiv', :controller => 'assuntos', :action => 'consultaAsuLiv'
  

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
