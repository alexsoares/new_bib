class Unidade < ActiveRecord::Base
  attr_accessible :nome, :tipo
  has_many :users
  has_many :funcionarios
  belongs_to :unidades_gpd
  belongs_to :tipo
  has_many :localizacoes
end
