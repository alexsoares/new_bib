class Jogo < ActiveRecord::Base
  #attr_accessible :localizacao, :tombo_seduc, :tombo_l, :nome, :faixa_etaria, :tipo, :fabricante, :obs


    belongs_to :localizacao

  FAIXA_ETARIA = %w(3_ANOS 5_ANOS 6_ANOS  10_ANOS 14_ANOS 18_ANOS TODAS_IDADES)



  def auto_inc_tombo_seduc
    self.tombo_seduc =+ 1
  end

end
