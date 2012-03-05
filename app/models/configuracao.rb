class Configuracao < ActiveRecord::Base
  #attr_accessible :data_criacao, :dias_posse, :dias_para_aviso
  has_many :logs
  before_create :type_of
  attr_accessor :tipo_config
  Tipo = %w(Jogos Midias Dicionario_Enciclopedias Livros Mapas Periodicos)

  def type_of
    if self.tipo_config == "Jogos"
      self.tipo = 1
    else
      if self.tipo_config == "Midias"
        self.tipo = 2
      else
        if self.tipo_config == "Dicionario_Enciclopedias"
          self.tipo = 3
        else
          if self.tipo_config == "Livros"
            self.tipo = 4
          else
            if self.tipo_config == "Mapas"
              self.tipo = 5
            else
              if self.tipo_config == "Periodicos"
                self.tipo = 6
              end
            end
          end
        end
      end
    end
  end

  def invoke_type
    if self.tipo == 1
       "Jogos"
    else
      if self.tipo == 2
        "Midias"
      else
        if self.tipo == 3
          "Dicionario_Enciclopedias"
        else
          if self.tipo == 4
            "Livros"
          else
            if self.tipo == 5
              "Mapas"
            else
              if self.tipo == 6
                "Periodicos"
              end
            end
          end
        end
      end
    end
  end

end
# 1 - Jogos
# 2 - Mídias
# 3 - Dicionarios e Enciclopedias
# 4 - Livros
# 5 - Mapas
# 6 - Periódicos