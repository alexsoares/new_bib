class Editora < ActiveRecord::Base
  attr_accessible :nome, :cidade, :pais

def before_save
    self.nome.upcase!
    self.cidade.upcase!
    self.pais.upcase!
end

end
