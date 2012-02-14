class DicionarioEnciclopedia < ActiveRecord::Base
  #attr_accessible :editora, :area, :localizacao, :identificacao, :tombo_seduc, :tombo_l, :colecao, :tipo, :volume, :data_edicao, :local_edicao, :obs
  attr_accessor :check
  after_create :auto_inc_tombo_seduc, :multi_tombo
  has_and_belongs_to_many :autores
  attr_accessor :qtde, :lista_tombos, :usuario
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
    self.save
  end

end
