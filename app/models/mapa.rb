class Mapa < ActiveRecord::Base
  #attr_accessible :editora, :localizacao, :tombo_seduc, :tombo_l, :tipo,:titulo, :subtitulo, :ano, :formato, :data_edicao, :local_edicao, :edicao, :obs
  attr_accessor :check
  belongs_to :editora
  belongs_to :localizacao

  TIPO_MAPA = %w(BIOGRÁFICO CLIMÁTICO DEMOGRÁFICO ECONÔNICO GEOGRÁFICO HIDROGÁFICO HISTÓRICO POLÍTICO RODOVIÁRIO TOPOGRÁFICO OUTROS)
  FORMATO_MAPA = %w(GLOBO LIVRO PLANO OUTROS)


  def auto_inc_tombo_seduc
    self.tombo_seduc =+ 1
  end

end
