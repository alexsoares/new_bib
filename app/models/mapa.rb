class Mapa < ActiveRecord::Base
  has_many :possuis
  has_many :dpus
  #attr_accessible :editora, :localizacao, :tombo_seduc, :tombo_l, :tipo,:titulo, :subtitulo, :ano, :formato, :data_edicao, :local_edicao, :edicao, :obs
  attr_accessor :check
  belongs_to :editora
  belongs_to :localizacao
  after_create :cria_possui_mp, :auto_inc_tombo_seduc
  TIPO_MAPA = %w(BIOGRÁFICO CLIMÁTICO DEMOGRÁFICO ECONÔNICO GEOGRÁFICO HIDROGÁFICO HISTÓRICO POLÍTICO RODOVIÁRIO TOPOGRÁFICO OUTROS)
  FORMATO_MAPA = %w(GLOBO LIVRO PLANO OUTROS)


  def auto_inc_tombo_seduc
    self.tombo_seduc = self.id
  end

  def cria_possui_mp
    possui = Possui.new
    possui.unidade_id = 3
    possui.tombo = "mp-#{self.tombo_l}"
    possui.mapa_id = self.id
    possui.status = 1
    possui.save
  end

end
