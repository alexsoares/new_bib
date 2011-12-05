class DicionarioEnciclopedia < ActiveRecord::Base
  #attr_accessible :editora, :area, :localizacao, :identificacao, :tombo_seduc, :tombo_l, :colecao, :tipo, :volume, :data_edicao, :local_edicao, :obs
  attr_accessor :check
  belongs_to :area
  belongs_to :editora
  belongs_to :localizacao
  belongs_to :identificacao
  
TIPO_DIC_ENC = %w(DICIONÁRIO ENCICLOPÉDIA OUTROS)

  def before_save


    self.colecao.upcase!
    self.local_edicao.upcase!
    self.obs.upcase!
end

    def auto_inc_tombo_seduc
    self.tombo_seduc =+ 1
  end

end
