class Jogo < ActiveRecord::Base
  #attr_accessible :localizacao, :tombo_seduc, :tombo_l, :nome, :faixa_etaria, :tipo, :fabricante, :obs


    belongs_to :localizacao

  FAIXA_ETARIA = %w(0-3_ANOS 4-5_ANOS 6-7_ANOS  8-10_ANOS 11-13_ANOS 14_OU_MAIS)

  def before_save
    self.tombo_seduc.upcase!
    self.tombo_l.upcase!
    self.nome.upcase!
    self.fabricante.upcase!
    self.tipo.upcase!
    self.obs.upcase!
end


end
