class Identificacao < ActiveRecord::Base
  #attr_accessible :codigo, :livro, :subtitulo, :obs
  has_many :dicionario_enciclopedias
  has_many :livros

def before_save
#    self.livro.upcase!
#    self.subtitulo.upcase!
#    self.obs.upcase!
end

end
