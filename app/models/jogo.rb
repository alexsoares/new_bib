class Jogo < ActiveRecord::Base
  attr_accessible :localizacao, :tombo_seduc, :tombo_l, :nome, :faixa_etaria, :tipo, :fabricante, :obs
end
