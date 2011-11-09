class Identificacao < ActiveRecord::Base
  #attr_accessible :codigo, :livro, :subtitulo, :obs
  has_many :dicionario_enciclopedias
end
