class Unidade < ActiveRecord::Base
  attr_accessible :nome, :tipo
  has_many :configuracoes
  has_many :users
  has_many :funcionarios
  belongs_to :unidades_gpd
  belongs_to :tipo
  has_many :localizacoes
  has_many :emprestimos
  has_many :possuis
  has_many :dpus

  def short_name
    "as"
  end
end
