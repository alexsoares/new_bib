class Cantor < ActiveRecord::Base

  has_and_belongs_to_many :musicas


def before_save
    self.nome.upcase!

end

end
