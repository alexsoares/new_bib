class Mapas < ActiveRecord::Base
  #attr_accessible :editora, :localizacao, :tombo_seduc, :tombo_l, :tipo,:titulo, :subtitulo, :ano, :formato, :data_edicao, :local_edicao, :edicao, :obs
  attr_accessor :check
  belongs_to :editora
  belongs_to :localizacao

  TIPO_MAPA = %w(BIOGRÁFICO CLIMÁTICO DEMOGRÁFICO ECONÔNICO GEOGRÁFICO HIDROGÁFICO HISTÓRICO POLÍTICO RODOVIÁRIO TOPOGRÁFICO OUTROS)
  FORMATO_MAPA = %w(GLOBO PLANO OUTROS)

def before_save
    self.tombo_seduc.upcase!
    self.tombo_l.upcase!
    self.titulo.upcase!
    self.subtitulo.upcase!
    self.local_edicao.upcase!
    self.obs.upcase!
end

end
