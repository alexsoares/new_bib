class ConsultasController < ApplicationController
  before_filter :load_resources
  def index
  end

  def gerar_tombos
  end

  def criacao_possui
    t = params[:tabela]
    tabela = (params[:tabela].capitalize).camelize.constantize

    (tabela.all).each do |z|
      possui = Dpu.new
      possui.unidade_id = 3
      if params[:tabela].to_s == 'Livro'
        possui.tombo = "li-#{z.tombo_l}"
        possui.livro_id = z.id
      else
        if params[:tabela].to_s == 'Dicionario_enciclopedia'
          possui.tombo = "de-#{z.tombo_l}"
          possui.dicionario_enciclopedia_id = z.id
        else
          if params[:tabela].to_s == 'Jogo'
            possui.tombo = "jg-#{z.tombo_l}"
            possui.jogo_id = z.id
          else
            if params[:tabela].to_s == 'Midia'
              possui.tombo = "md-#{z.tombo_l}"
              possui.midia_id = z.id
            else
              if params[:tabela].to_s == 'Mapa'
                possui.tombo = "mp-#{z.tombo_l}"
                possui.mapa_id = z.id
              else
                if params[:tabela].to_s == 'Periodico'
                  possui.tombo = "pd-#{z.tombo_l}"
                  possui.periodico_id = z.id
                end
              end
            end
          end
        end
      end
      possui.status = 1
      possui.save
    end
#    index = (Possui::TABELAS).index {|v| v == params[:tabela].to_s}
 #   (Possui::TABELAS).delete_at(index)
    render :update do |page|
      page.replace_html "tabelas", :partial => "tabelas"
    end
  end

  def tabela_selecionada
      tabela = params[:tabelas]
      @campos = (tabela.camelize.singularize.constantize).column_names.insert(0,"*")
      render :partial => "lista_campos"
  end

  def lista_tombo
    @tombo_livros = Livro.all(:conditions => ["tombo_seduc <> id"])
  end

  def corrigir_tombos
    tombo_livros = Livro.all(:conditions => ["tombo_seduc <> id"])
    tombo_livros.each do |tombo|
      tombo.tombo_seduc = tombo.id
      tombo.save
    end
#    redirect_to lista_tombo_consultas_path
    render :update do |page|
      page.replace_html "status", :text => "Problemas solucionados"
    end
  end

  def criar_consulta
    #@campos = User.column_names
    @livro = Livro.new
    @assuntos = Assunto.all
     @tabelas = []
    @tables = ActiveRecord::Base.connection.tables
    @tables.each do |z|
      elementos = z.split("_")
      if elementos.count == 1
        @tabelas << z
      end
    end
    @tabelas.insert(0,"")
  end

  def params_consulta    
    campos = params[:fields].chop! if params[:fields][params[:fields].length-1,1] == ","
    tabela = params[:table].singularize.capitalize!
    clausula = params[:clausulas]
    @result = tabela.constantize.all(:select => campos)
    t = 0
  end

  protected

  def load_resources
    @tables = ActiveRecord::Base.connection.tables
  end


end
