class Assunto < ActiveRecord::Base
  belongs_to :livro
  has_many :itens_assuntos, :dependent => :destroy
  accepts_nested_attributes_for :itens_assuntos, :reject_if => lambda {|a| a[:sub_assunto].blank?}, :allow_destroy => true
  
end
