class Jogo < ActiveRecord::Base
  #attr_accessible :localizacao, :tombo_seduc, :tombo_l, :nome, :faixa_etaria, :tipo, :fabricante, :obs


    belongs_to :localizacao

  FAIXA_ETARIA = %w(0-3_ANOS 4-5_ANOS 6-7_ANOS  8-10_ANOS 11-13_ANOS 14_OU_MAIS TODAS)



  def auto_inc_tombo_seduc
    self.tombo_seduc =+ 1
  end

end
