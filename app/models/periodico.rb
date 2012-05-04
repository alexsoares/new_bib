class Periodico < ActiveRecord::Base
  #attr_accessible :localizacao, :tombo_seduc, :tombo_l, :tipo, :titulo, :subtitulo, :colecao, :producao, :periodicidade, :issn, :local_producao, :data_producao, :obs
  has_many :possuis, :dependent => :destroy
  has_many :dpus, :dependent => :destroy
  belongs_to :localizacao
  after_create :cria_possui_pd, :auto_inc_tombo_seduc, :disponibiliza_pd
  attr_accessor :usuario,:unidade

  PERIODICIDADE = %w(DIARIO SEMANAL QUINZENAL MENSAL BIMESTRAL SEMETRAL ANUAL OUTROS)
  TIPO_PERIODICO = %w(ANUARIO BOLETIM JORNAL REVISTA OUTROS)


  def auto_inc_tombo_seduc
    self.tombo_seduc = self.id
  end

  def cria_possui_pd
    possui = Possui.new
    possui.unidade_id = self.unidade
    possui.tombo = "pd-#{self.tombo_l}"
    possui.periodico_id = self.id
    possui.status = 1
    possui.save
  end

  def disponibiliza_pd
    disp = Dpu.new
    disp.unidade_id = self.unidade
    disp.tombo = "pd-#{self.tombo_l}"
    disp.periodico_id = self.id
    disp.status = 1
    disp.save
  end



end
