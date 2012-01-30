class Jogo < ActiveRecord::Base
  after_create :multi_tombo
  #attr_accessible :localizacao, :tombo_seduc, :tombo_l, :nome, :faixa_etaria, :tipo, :fabricante, :obs
  attr_accessor :qtde_jogos, :lista_tombos, :usuario
    has_many :possuis
    belongs_to :localizacao
    has_many :tombos
    validates_presence_of :localizacao_id,:tombo_l, :nome, :faixa_etaria, :fabricante

  FAIXA_ETARIA = %w(3_ANOS 5_ANOS 6_ANOS  10_ANOS 14_ANOS 18_ANOS TODAS_IDADES)

  def multi_tombo
    multi = Tombo.new
    multi.jogo_id = self.id
    multi.user_id = self.usuario
    multi.index_tombo = "#{self.id} - #{self.usuario}"
    multi.qtde_livro = self.qtde_jogos
    multi.save
  end


  def auto_inc_tombo_seduc
    self.tombo_seduc =+ 1
  end

end
