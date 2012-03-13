class Possui < ActiveRecord::Base
  belongs_to :unidade
  belongs_to :livro
  belongs_to :dicionario_enciclopedia
  belongs_to :jogo
  belongs_to :mapa
  belongs_to :midia
  belongs_to :periodico


  TABELAS = %w(Jogos Livros Mapas Midias Periodicos Dicionario_enciclopedias)


end
