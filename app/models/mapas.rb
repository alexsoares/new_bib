class Mapas < ActiveRecord::Base
  attr_accessible :editora, :localizacao, :tombo_seduc, :tombo_l, :tipo, :subtitulo, :ano, :formato, :data_edicao, :local_edicao, :edicao, :obs
end
