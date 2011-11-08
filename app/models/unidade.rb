class Unidade < ActiveRecord::Base
  attr_accessible :nome, :tipo
  has_many :users
end
