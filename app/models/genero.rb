class Genero < ActiveRecord::Base
has_many :audio_visuais
validates_presence_of :nome

end
