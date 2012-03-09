class DicionarioEnciclopedia < ActiveRecord::Base
  #attr_accessible :editora, :area, :localizacao, :identificacao, :tombo_seduc, :tombo_l, :colecao, :tipo, :volume, :data_edicao, :local_edicao, :obs
  attr_accessor :check
  after_create :auto_inc_tombo_seduc, :multi_tombo, :cria_possui_de,:cria_disponibiliza_de
  has_and_belongs_to_many :autores
  attr_accessor :qtde, :lista_tombos, :usuario,:unidade
  has_many :tombos
  has_many :possuis
  has_many :dpus
  belongs_to :area
  belongs_to :editora
  belongs_to :localizacao
  belongs_to :identificacao

  
  TIPO_DIC_ENC = %w(DICIONÁRIO ENCICLOPÉDIA OUTROS)

def qtd_dif_num?
    qtd = self.lista_tombos.split(";")
    self.qtde.to_i =! qtd.count
  end

  def multi_tombo
    multi = Tombo.new
    multi.dicionario_enciclopedia_id = self.id
    multi.user_id = self.usuario
    multi.index_tombo = "#{self.id} - #{self.usuario}"
    multi.qtde_livro = self.qtde
    multi.save
  end

  def auto_inc_tombo_seduc
    self.tombo_seduc = self.id
  end

  def cria_possui_de
    possui = Possui.new
    possui.unidade_id = self.unidade
    possui.tombo = "de-#{self.tombo_l}"
    possui.enciclopedia_dicionario_id = self.id
    possui.status = 1
    possui.save
  end

  def cria_disponibiliza_de
    disp = Dpu.new
    disp.unidade_id = self.unidade
    disp.tombo = "mp-#{self.tombo_l}"
    disp.enciclopedia_dicionario_id = self.id
    disp.status = 1
    disp.save
  end



end
