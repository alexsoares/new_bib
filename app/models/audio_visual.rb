class AudioVisual < ActiveRecord::Base
  attr_accessible :genero_midia, :localizacao, :tombo_seduc, :tombo_l, :tipo, :titulo, :subtitulo, :producao, :local_producao, :data_producao, :obs
end
