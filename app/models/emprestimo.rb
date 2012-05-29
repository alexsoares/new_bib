class Emprestimo < ActiveRecord::Base
  before_create :kind_of, :inabilita
  after_update :habilita
  has_one :devolucao
  has_and_belongs_to_many :dpus
  belongs_to :unidade
  validate :unico
  attr_accessor :dpu, :pessoa, :type, :filtro,:filtro_ambos

  Tipo = {'Funcionário' => 0, 'Aluno' => 1}
  Kind = {'Livro' => 0, 'Dicionario / enciclopedia' => 1}
  
  def inabilita
    dpu_emprestada = Dpu.find(self.dpus)
    dpu_emprestada.each do |z|
      z.status = 0
      z.save
    end
  end

  def habilita
    dpu_devolvida = Dpu.find(self.dpus)
    dpu_devolvida.each do |z|
      z.status = 1
      z.save
    end
    cria_dev(self.id, Date.today)
  end

  def cria_dev(emprestimo, data_devolucao)
    devolucao = Devolucao.new
    devolucao.emprestimo_id = emprestimo
    devolucao.data_devolucao = data_devolucao
    devolucao.save
  end

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
        errors.add_to_base("Já existe um empréstimo em vigor.")
        errors.add_to_base(" Efetue a devolução para realizar outro empréstimo.")
      end
    end
  end

  def seu_status?
    if self.status == false
      "Emprestimo encerrado"
    else
      "Emprestimo em vigência"
    end
  end
  def sua_data_entrega?
    entregue = Devolucao.find_by_emprestimo_id(self.id)
    entregue.data_devolucao.strftime("%d/%m/%Y") if entregue.present?
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
      default = 7
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

  def emprestado_para
    if self.tipo_emprestimo == 1

      " #{Aluno.find((self.funcionario.present? ? self.funcionario : self.pessoa ).to_i).nome} (Funcionário)"
    else
      " #{Aluno.find((self.aluno.present? ? self.aluno : self.pessoa).to_i).nome} (Aluno)"
    end
  end

  def exibe_ra_mat
    if self.tipo_emprestimo == 1
      Aluno.find((self.funcionario).to_i).matricula_funcionario
    else
      Aluno.find((self.aluno).to_i).aluno_ra
    end
  end

  def data_validade_expirada?
    diferenca = (self.data_devolucao.to_date - Time.now.to_date).to_i
  end
end
