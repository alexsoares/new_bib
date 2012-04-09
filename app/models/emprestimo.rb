class Emprestimo < ActiveRecord::Base
  #has_many :emprestimos_realizados
  #has_many :dpus, :through => :emprestimos_realizados
  has_and_belongs_to_many :dpus
  Tipo = {'Funcionário' => 0, 'Aluno' => 1}
  Kind = {'Livro' => 0, 'Dicionario / enciclopedia' => 1}
  before_create :kind_of
  #after_create :cria_emprestimos_realizados,:kind_of
  validate :unico
  belongs_to :unidade
  # :dpu => Disponiveis para empréstimos por unidade
  #accepts_nested_attributes_for :dpus, :reject_if => lambda {|a| a[:conteudo].blank?}, :allow_destroy => true
  attr_accessor :dpu, :pessoa, :type, :filtro,:filtro_ambos
  

  def unico
    unless self.id.present?
      if self.tipo_emprestimo == 0
        encontrou = Emprestimo.find_by_aluno(self.pessoa, :conditions => ["status = 1"])
      else
        if self.tipo_emprestimo == 1
          encontrou = Emprestimo.find_by_funcionario(self.pessoa, :conditions => ["status = 1"])
        end
      end
      if encontrou.present?
        errors.add_to_base("Já existe um empréstimo em vigor. Efetue a devolução para realizar outro empréstimo.")
      end
    end
  end

  def inclui_data
    self.data_emprestimo = Date.today
    self.status = 1
    self.data_devolucao = self.data_emprestimo + ((data_config).to_i).days
    p = self.data_emprestimo + ((data_config).to_i).days
  end

  def data_config
    config = Configuracao.find_by_unidade_id(self.unidade_id)
    if config.present?
      config.dias_posse
    else
      default = 3
    end
  end

  def kind_of
    if self.tipo_emprestimo == 1
      self.funcionario = self.pessoa
    else
      self.aluno = self.pessoa
    end
    inclui_data
  end

  #def cria_emprestimos_realizados
  #  er = EmprestimosRealizados.new
  #  er.ativo = 1
  #  er.dpu_id = self.dpu
  #  er.emprestimo_id = self.id
  #  er.save
  #  update_dpu
  #end

  #def update_dpu
  #  self.dpu.each do |z|
  #    disponibilidade = Dpu.find((z).to_i)
  #    disponibilidade.status = 0
  #    disponibilidade.save
  #  end
 # end

  def emprestado_para
    if self.tipo_emprestimo == 1
      "Professor: #{Aluno.find((self.funcionario).to_i).nome}"
    else
      "Aluno: #{Aluno.find((self.aluno).to_i).nome}"
    end
  end

  def exibe_ra_mat
    if self.tipo_emprestimo == 1
      Aluno.find((self.funcionario).to_i).matricula_funcionario
    else
      Aluno.find((self.aluno).to_i).aluno_ra
    end
  end
  
end
