class Livro < ActiveRecord::Base
  #attr_accessible :assunto, :identificacao, :area, :editora, :localizacao, :tombo_seduc, :tombo_l, :colecao, :edicao, :data_edicao, :local_edicao, :resumo, :obs
  has_and_belongs_to_many :assuntos
  
  belongs_to :identificacao
  belongs_to :area
  belongs_to :editora
  belongs_to :localizacao
  #accepts_nested_attributes_for :assuntos, :reject_if => lambda {|a| a[:descricao].blank?}, :allow_destroy => true
  accepts_nested_attributes_for :localizacao, :reject_if => lambda {|a| a[:local_guardado].blank?}, :allow_destroy => true
end


