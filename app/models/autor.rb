class Autor < ActiveRecord::Base
  attr_accessible :nome

def before_save
    self.nome.upcase!

end

end
