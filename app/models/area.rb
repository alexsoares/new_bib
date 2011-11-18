class Area < ActiveRecord::Base
  has_many :livros
  #attr_accessible :nome


def before_save
    self.nome.upcase!  
end

end
