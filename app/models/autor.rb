class Autor < ActiveRecord::Base
  attr_accessible :nome
  has_many :livros

def before_save
    self.nome.upcase!

end

end
