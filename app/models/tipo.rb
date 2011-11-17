class Tipo < ActiveRecord::Base
  #attr_accessible :nome
  has_many :unidades
end
