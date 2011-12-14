class Localizacao < ActiveRecord::Base
  #attr_accessible :unidade, :local_guardado, :aquisicao, :data_aquisicao
  belongs_to :unidade
  has_many :livros
  has_many :mapas

  FORMAAQUISICAO = %w(DOAÇÃO  AQUISIÇÃO_SEDUC AQUISIÇÃO_UNIDADE ENVIADO_MEC ENVIADO_SEC_EST_EDUC OUTROS)


  def add_unidade(unidade)
    self.unidade_id = unidade
  end
end
