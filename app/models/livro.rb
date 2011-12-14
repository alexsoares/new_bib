class Livro < ActiveRecord::Base
  after_create :auto_inc_tombo_seduc
  #attr_accessible :assunto, :identificacao, :area, :editora, :localizacao, :tombo_seduc, :tombo_l, :colecao, :edicao, :data_edicao, :local_edicao, :resumo, :obs
  has_and_belongs_to_many :assuntos
  has_and_belongs_to_many :autores
  
  belongs_to :identificacao
  belongs_to :area
  belongs_to :editora
  belongs_to :localizacao
  #accepts_nested_attributes_for :assuntos, :reject_if => lambda {|a| a[:descricao].blank?}, :allow_destroy => true
  #accepts_nested_attributes_for :localizacao, :reject_if => lambda {|a| a[:local_guardado].blank?}, :allow_destroy => true
  validates_presence_of :identificacao_id, :message => "Campo obrigatório"
  validates_presence_of :area_id, :message => "Campo obrigatório"
  validates_presence_of :tombo_l, :message => "Campo obrigatório"
  validates_presence_of :autor_ids, :message => "Campo obrigatório"
  validates_presence_of :localizacao_id, :message => "Campo obrigatório"
  validates_presence_of :editora_id, :message => "Campo obrigatório"
  validates_presence_of :localizacao_id, :message => "Campo obrigatório"
  validates_presence_of :assunto_ids, :message => "Campo obrigatório"
  

  def auto_inc_tombo_seduc
    self.tombo_seduc = self.id
  end

end


