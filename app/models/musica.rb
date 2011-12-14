class Musica < ActiveRecord::Base
  
  has_and_belongs_to_many :cantores
  has_and_belongs_to_many :audio_visuais

def before_save
    self.nome.upcase!

end

end
