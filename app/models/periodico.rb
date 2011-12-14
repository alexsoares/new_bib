class Periodico < ActiveRecord::Base
  #attr_accessible :localizacao, :tombo_seduc, :tombo_l, :tipo, :titulo, :subtitulo, :colecao, :producao, :periodicidade, :issn, :local_producao, :data_producao, :obs

  belongs_to :localizacao

  PERIODICIDADE = %w(DIARIO SEMANAL QUINZENAL MENSAL BIMESTRAL SEMETRAL ANUAL OUTROS)
  TIPO_PERIODICO = %w(ANUARIO BOLETIM JORNAL REVISTA OUTROS)


  def auto_inc_tombo_seduc
    self.tombo_seduc =+ 1
  end


end
