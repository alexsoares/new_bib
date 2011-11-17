class Localizacao < ActiveRecord::Base
  #attr_accessible :unidade, :local_guardado, :aquisicao, :data_aquisicao
  belongs_to :unidade

  def add_unidade(unidade)
    self.unidade_id = unidade
  end
end
