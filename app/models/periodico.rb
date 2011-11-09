class Periodico < ActiveRecord::Base
  #attr_accessible :localizacao, :tombo_seduc, :tombo_l, :tipo, :titulo, :subtitulo, :colecao, :producao, :periodicidade, :issn, :local_producao, :data_producao, :obs

  belongs_to :localizacao

  PERIODICIDADE = %w(DIARIO SEMANAL QUINZENAL MENSAL BIMESTRAL SEMETRAL ANUAL OUTROS)
  TIPO_PERIODICO = %w(ANUARIO BOLETIM JORNAL REVISTA OUTROS)

  def before_save
    self.tombo_seduc.upcase!
    self.tombo_l.upcase!
    self.titulo.upcase!
    self.subtitulo.upcase!
    self.colecao.upcase!
    self.producao.upcase!
    self.local_producao.upcase!
    self.obs.upcase!
end



end
