class Identificacao < ActiveRecord::Base
  #attr_accessible :codigo, :livro, :subtitulo, :obs
  include ActionView::Helpers::TextHelper

  has_many :dicionario_enciclopedias
  has_many :livros

  



def truncated_value
  truncate(self.livro, :length => 55, :omission => "...")
end  
end
