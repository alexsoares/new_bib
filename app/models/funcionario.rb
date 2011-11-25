class Funcionario < ActiveRecord::Base
  #attr_accessible :nome, :matricula
  belongs_to :unidade
  has_many :emprestimos
end
