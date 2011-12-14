class CalculosController < ApplicationController

  def arruma_tombo
    @livros = Livro.all
    @livros.each do |livro|
      livro.tombo_seduc = livro.id
      livro.save
    end
    
  end
end
