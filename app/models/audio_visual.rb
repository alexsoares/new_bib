class AudioVisual < ActiveRecord::Base
 belongs_to :localizacao
 has_and_belongs_to_many :musicas

  TIPO = %w(CD DVD LP VHS OUTRAS)

  def auto_inc_tombo_seduc
    self.tombo_seduc =+ 1
  end

end
