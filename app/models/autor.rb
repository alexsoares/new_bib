class Autor < ActiveRecord::Base
  has_and_belongs_to_many :livros
  #attr_accessible :nome
  #has_many :livros

def before_save
#    self.nome.upcase!

end

end
