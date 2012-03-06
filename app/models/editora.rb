class Editora < ActiveRecord::Base
  attr_accessible :nome, :cidade, :pais
has_many :livros

end
