class Localizacao < ActiveRecord::Base
  #attr_accessible :unidade, :local_guardado, :aquisicao, :data_aquisicao
  belongs_to :unidade
  has_many :livros
  has_many :mapas
  has_many :audio_visuais

  FORMAAQUISICAO = %w(DOAÇÃO  AQUISIÇÃO_SEDUC AQUISIÇÃO_UNIDADE ENVIADO_MEC ENVIADO_SEC_EST_EDUC OUTROS)


def before_save
    self.aquisicao.upcase!
    self.local_guardado.upcase!
 
end

  def add_unidade(unidade)
    self.unidade_id = unidade
  end
end
