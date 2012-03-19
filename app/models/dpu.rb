class Dpu < ActiveRecord::Base
  belongs_to :unidade
  belongs_to :livro
  belongs_to :dicionario_enciclopedia
  belongs_to :jogo
  belongs_to :mapa
  belongs_to :midia
  belongs_to :periodico
  #has_many :emprestimos, :through => "emprestimos_realizados"
  has_and_belongs_to_many :empresimos
  TABELAS = %w(Jogo Livro Mapa Midia Periodico Dicionario_enciclopedia)

  def busca_livro
    self.livro.identificacao.livro.present? ? self.livro.identificacao.livro : "Livro sem titulo"
  end

  def lista
    if self.livro_id.present?
      "#{self.livro.identificacao.livro} - #{self.livro.tombo_l}"
    else
      if self.dicionario_enciclopedia_id.present?
        "#{self.dicionario_enciclopedia.identificacao.livro} - #{self.dicionario_enciclopedia.tombo_l}"
      end
    end
  end
end
