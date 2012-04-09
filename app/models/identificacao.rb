class Identificacao < ActiveRecord::Base
  #attr_accessible :codigo, :livro, :subtitulo, :obs
  include ActionView::Helpers::TextHelper

  has_many :dicionario_enciclopedias, :dependent => :destroy
  has_many :livros, :dependent => :destroy
  has_many :audio_visuais, :dependent => :destroy

  



def truncated_value
  truncate(self.livro, :length => 55, :omission => "...")
end  
end
