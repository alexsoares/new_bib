class Periodico < ActiveRecord::Base
  #attr_accessible :localizacao, :tombo_seduc, :tombo_l, :tipo, :titulo, :subtitulo, :colecao, :producao, :periodicidade, :issn, :local_producao, :data_producao, :obs
  has_many :possuis
  has_many :dpus
  belongs_to :localizacao
  after_create :cria_possui_pd, :auto_inc_tombo_seduc

  PERIODICIDADE = %w(DIARIO SEMANAL QUINZENAL MENSAL BIMESTRAL SEMETRAL ANUAL OUTROS)
  TIPO_PERIODICO = %w(ANUARIO BOLETIM JORNAL REVISTA OUTROS)


  def auto_inc_tombo_seduc
    self.tombo_seduc = self.id
  end

  def cria_possui_pd
    possui = Possui.new
    possui.unidade_id = 3
    possui.tombo = "pd-#{self.tombo_l}"
    possui.periodico_id = self.id
    possui.status = 1
    possui.save
  end



end
