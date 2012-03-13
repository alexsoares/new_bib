class Emprestimo < ActiveRecord::Base
  has_many :emprestimos_realizados
  has_many :dpus, :through => :emprestimos_realizados

  Tipo = {'Funcionário' => 0, 'Aluno' => 1}
  after_create :cria_emprestimos_realizados,:kind_of
  #attr_accessible :tipo_emprestimo, :professor, :aluno
  belongs_to :unidade
  #validates_presence_of :tipo_emprestimo, :dpu
  # :dpu => Disponiveis para empréstimos por unidade
  #accepts_nested_attributes_for :dpus, :reject_if => lambda {|a| a[:conteudo].blank?}, :allow_destroy => true
  attr_accessor :dpu, :pessoa
  validates_presence_of :dpu, :message => ": Ao menos 1 livro deverá ser selecionado."



  def kind_of
    if self.tipo_emprestimo == 0
      self.funcionario = self.pessoa
    else
      self.aluno = self.pessoa
    end
  end
  def cria_emprestimos_realizados
    er = EmprestimosRealizados.new
    er.ativo = 1
    er.dpu_id = self.dpu
    er.emprestimo_id = self.id
    er.save
    update_dpu
  end

  def update_dpu
    self.dpu.each do |z|
      disponibilidade = Dpu.find((z).to_i)
      disponibilidade.status = 0
      disponibilidade.save
    end
  end

  def emprestado_para
    if self.tipo_emprestimo == 0
      t = self.funcionario
      "Professor: #{Aluno.find((self.funcionario).to_i).nome}"
    else
      t = self.aluno
      "Aluno: #{Aluno.find((self.aluno).to_i).nome}"
    end
  end

  def exibe_ra_mat
    if self.tipo_emprestimo == 0
      Aluno.find((self.funcionario).to_i).matricula_funcionario
    else
      Aluno.find((self.aluno).to_i).aluno_ra
    end
  end
  
end
