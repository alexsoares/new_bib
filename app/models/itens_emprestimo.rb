class ItensEmprestimo < ActiveRecord::Base
  attr_accessible :emprestimo, :audio_visual, :livro, :dicionario_enciclopedia, :mapas, :periodico, :jogo
end
