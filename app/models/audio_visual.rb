class AudioVisual < ActiveRecord::Base
 belongs_to :localizacao
 has_and_belongs_to_many :musicas
 has_and_belongs_to_many :cantores
 belongs_to :genero

  TIPO = %w(CD DVD VHS OUTRAS)

  def auto_inc_tombo_seduc
    self.tombo_seduc =+ 1
  end

end
