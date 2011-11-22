class Assunto < ActiveRecord::Base  
  #has_many :livros
  has_and_belongs_to_many :livros
  attr_accessor :novo_valor
  validates_presence_of :descricao
  #before_save :val_descricao
  #has_many :itens_assuntos, :dependent => :destroy
  #accepts_nested_attributes_for :itens_assuntos, :reject_if => lambda {|a| a[:sub_assunto].blank?}, :allow_destroy => true


#  def val_descricao
#    if self.novo_valor.present?
#      self.descricao = self.novo_valor
#    end
#  end

  def before_save
    self.descricao.upcase!
end
end
