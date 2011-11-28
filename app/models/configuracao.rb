class Configuracao < ActiveRecord::Base
  attr_accessible :user, :data_criacao, :dias_posse, :dias_para_aviso
end
