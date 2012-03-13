class Mapa < ActiveRecord::Base
  has_many :possuis
  has_many :dpus
  #attr_accessible :editora, :localizacao, :tombo_seduc, :tombo_l, :tipo,:titulo, :subtitulo, :ano, :formato, :data_edicao, :local_edicao, :edicao, :obs
  attr_accessor :check, :usuario, :unidade
  belongs_to :editora
  belongs_to :localizacao
  after_create :cria_possui_mp, :auto_inc_tombo_seduc, :cria_disponibiliza_mp
  TIPO_MAPA = %w(BIOGRÁFICO CLIMÁTICO DEMOGRÁFICO ECONÔNICO GEOGRÁFICO HIDROGÁFICO HISTÓRICO POLÍTICO RODOVIÁRIO TOPOGRÁFICO OUTROS)
  FORMATO_MAPA = %w(GLOBO LIVRO PLANO OUTROS)


  def auto_inc_tombo_seduc
    self.tombo_seduc = self.id
  end

  def cria_possui_mp
    possui = Possui.new
    possui.unidade_id = self.unidade
    possui.tombo = "mp-#{self.tombo_l}"
    possui.mapa_id = self.id
    possui.status = 1
    possui.save
  end

  def cria_disponibiliza_mp
    disp = Dpu.new
    disp.unidade_id = self.unidade
    disp.tombo = "mp-#{self.tombo_l}"
    disp.mapa_id = self.id
    disp.status = 1
    disp.save
  end

end
