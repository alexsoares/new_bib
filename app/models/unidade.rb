class Unidade < ActiveRecord::Base
  attr_accessible :nome, :tipo
  has_many :users
  belongs_to :unidades_gpd
  belongs_to :tipo
end
