class Dpu < ActiveRecord::Base
  belongs_to :unidade
  belongs_to :livro
  belongs_to :dicionario_enciclopedia
  belongs_to :jogo
  belongs_to :mapa
  belongs_to :midia
  belongs_to :periodico
  has_many :emprestimos, :through => "emprestimos_realizados"

  TABELAS = %w(Jogo Livro Mapa Midia Periodico Dicionario_enciclopedia)

  def busca_livro
    self.livro.identificacao.livro.present? ? self.livro.identificacao.livro : "Livro sem titulo"
  end

end
