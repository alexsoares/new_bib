class Livro < ActiveRecord::Base
  #attr_accessible :assunto, :identificacao, :area, :editora, :localizacao, :tombo_seduc, :tombo_l, :colecao, :edicao, :data_edicao, :local_edicao, :resumo, :obs
  attr_accessor :check
  belongs_to :assunto
  belongs_to :identificacao
  belongs_to :area
  belongs_to :editora
  belongs_to :localizacao
  accepts_nested_attributes_for :assunto, :reject_if => lambda {|a| a[:descricao].blank?}, :allow_destroy => true
end
