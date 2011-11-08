class ItensAssunto < ActiveRecord::Base
  attr_accessible :assunto, :sub_assunto
  belongs_to :assunto
end
