class Emprestimo < ActiveRecord::Base
  has_many :emprestimos_realizados
  has_many :dpus, :through => :emprestimos_realizados




  Tipo = {'Funcionário' => 0, 'Aluno' => 1}
  after_create :cria_emprestimos_realizados
  #attr_accessible :tipo_emprestimo, :professor, :aluno
  belongs_to :unidade
  validates_presence_of :tipo_emprestimo, :dpu
  #accepts_nested_attributes_for :dpus, :reject_if => lambda {|a| a[:conteudo].blank?}, :allow_destroy => true
  attr_accessor :dpu


  def cria_emprestimos_realizados
    er = EmprestimosRealizados.new
    er.ativo = 1
    er.dpu_id = self.dpu
    er.emprestimo_id = self.id
    er.save
  end

  
end
