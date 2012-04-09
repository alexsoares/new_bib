class Jogo < ActiveRecord::Base
  after_create :multi_tombo, :auto_inc_tombo_seduc, :cria_possui_jg,:cria_disponibiliza_jg
  #attr_accessible :localizacao, :tombo_seduc, :tombo_l, :nome, :faixa_etaria, :tipo, :fabricante, :obs
  attr_accessor :qtde_jogos, :lista_tombos, :usuario, :unidade
    has_many :possuis
    has_many :dpus
    belongs_to :localizacao
    has_many :tombos
    validates_presence_of :localizacao_id,:tombo_l, :nome, :faixa_etaria, :fabricante

  FAIXA_ETARIA = %w(3_ANOS 5_ANOS 6_ANOS  10_ANOS 14_ANOS 18_ANOS TODAS_IDADES)

  def cria_disponibiliza_jg
    disponivel = Dpu.new
    disponivel.jogo_id = self.id
    disponivel.tombo = "jg-#{self.id}"
    disponivel.unidade_id = self.unidade
    disponivel.status = 1
    disponivel.save
  end

  def multi_tombo
    multi = Tombo.new
    multi.jogo_id = self.id
    multi.user_id = self.usuario
    multi.index_tombo = "#{self.id} - #{self.usuario}"
    multi.qtde_livro = self.qtde_jogos
    multi.save
  end


  def auto_inc_tombo_seduc
    self.tombo_seduc = self.id
  end

  def cria_possui_jg
    possui = Possui.new
    possui.unidade_id = self.unidade
    possui.tombo = "jg-#{self.tombo_l}"
    possui.jogo_id = self.id
    possui.status = 1
    possui.save
  end


end
