class Emprestimo < ActiveRecord::Base
  Tipo = {'Funcionário' => 0, 'Aluno' => 1} 
  #attr_accessible :tipo_emprestimo, :professor, :aluno
  belongs_to :funcionario
  belongs_to :unidade



  
end
