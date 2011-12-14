class Cantor < ActiveRecord::Base

  has_and_belongs_to_many :musicas, :dependent => :destroy


def before_save
    self.nome.upcase!

end

end
