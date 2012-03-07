class Configuracao < ActiveRecord::Base
  #attr_accessible :data_criacao, :dias_posse, :dias_para_aviso
  has_many :logs
  belongs_to :configuracao
  before_create :type_of
  validate :validates_config_unit
  attr_accessor :tipo_config  
  Tipo = %w(Jogos Midias Dicionario_Enciclopedias Livros Mapas Periodicos)


  def validates_config_unit
    if self.tipo_config == "Jogos"
      valida = Configuracao.find_by_tipo(1, :conditions => ["unidade_id = ?", self.unidade_id])
    else
      if self.tipo_config == "Midias"
        valida = Configuracao.find_by_tipo(2, :conditions => ["unidade_id = ?", self.unidade_id])
      else
        if self.tipo_config == "Dicionario_Enciclopedias"
          valida = Configuracao.find_by_tipo(3, :conditions => ["unidade_id = ?", self.unidade_id])
        else
          if self.tipo_config == "Livros"
            valida = Configuracao.find_by_tipo(4, :conditions => ["unidade_id = ?", self.unidade_id])
          else
            if self.tipo_config == "Mapas"
              valida = Configuracao.find_by_tipo(5, :conditions => ["unidade_id = ?", self.unidade_id])
            else
              if self.tipo_config == "Periodicos"
                valida = Configuracao.find_by_tipo(6, :conditions => ["unidade_id = ?", self.unidade_id])
              end
            end
          end
        end
      end
    end
    if valida.present?
      errors.add_to_base("Já existe uma configuração de data para este tipo de objeto, para esta unidade")
    end
  end
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