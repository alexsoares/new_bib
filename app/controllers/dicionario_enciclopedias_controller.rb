class DicionarioEnciclopediasController < ApplicationController

  before_filter :login_required
  before_filter :load_resources
    def create_titulo
      @titulo = Identificacao.new(params[:titulo])
      if @titulo.save
        session[:identificacao_id] = @titulo.id
        @livro = Livro.new
        render :update do |page|
          page.replace_html 'aviso', :text => "Titulo Inserido, favor selecioná-lo"
          page.replace_html 'identificacao', :text => @titulo.livro
          page.replace_html 'subtitulo', :text => "<b>Subtitulo: </b>#{@titulo.subtitulo}"
        end
      end
    end

 def consultaDic
   unless (params[:search].present?) or (params[:search].to_s == "Digite parte da busca")
     if params[:type_of].to_i == 6
       @contador = DicionarioEnciclopedia.all(:include => [:localizacao],:conditions =>["localizacoes.unidade_id = ?",current_user.unidade_id]).count
       @dicionario_enciclopedias = DicionarioEnciclopedia.paginate :all, :page => params[:page], :per_page => 10, :joins => [:identificacao,:localizacao],:conditions =>["localizacoes.unidade_id = ?",current_user.unidade_id],:order => 'livro ASC'
       render :update do |page|
         page.replace_html 'dicionarios', :partial => "dicionarios"
       end
     end
   else
      if params[:type_of].to_i == 1
          @contador = DicionarioEnciclopedia.all(:include => [:localizacao,:identificacao], :conditions => ["identificacaos.livro like ? and localizacoes.unidade_id = ?", "%" + params[:search].to_s + "%",current_user.unidade_id]).count
          @contador = DicionarioEnciclopedia.all(:include => [:localizacao],:conditions =>["localizacoes.unidade_id = ?",current_user.unidade_id]).count
          @dicionario_enciclopedias = DicionarioEnciclopedia.paginate :all, :page => params[:page], :per_page => 10,  :joins => [:identificacao,:localizacao], :conditions => ["identificacaos.livro like ? and tipo =? and localizacoes.unidade_id = ?", "%" + params[:search].to_s + "%","DICIONÁRIO",current_user.unidade_id], :order => 'livro ASC'
          render :update do |page|
            page.replace_html 'dicionarios', :partial => "dicionarios"
          end
          else if params[:type_of].to_i == 2
            @contador = DicionarioEnciclopedia.all(:joins => [:identificacao,:localizacao], :conditions => ["identificacaos.livro like ? and localizacoes.unidade_id = ?", "%" + params[:search].to_s + "%",current_user.unidade_id]).count
            @dicionario_enciclopedias = DicionarioEnciclopedia.paginate :all, :page => params[:page], :per_page => 10,  :joins => [:localizacao,:identificacao], :conditions => ["identificacaos.livro like ? and tipo =? and localizacoes.unidade_id = ?", "%" + params[:search].to_s + "%","ENCICLOPÉDIA",current_user.unidade_id], :order => 'livro ASC'
            render :update do |page|
              page.replace_html 'dicionarios', :partial => "dicionarios"
            end
            else if params[:type_of].to_i == 3
              @contador = DicionarioEnciclopedia.all(:joins => [:identificacao,:localizacao], :conditions => ["identificacaos.livro like ? and unidade_id = ?", "%" + params[:search].to_s + "%",current_user.unidade_id]).count
              @dicionario_enciclopedias = DicionarioEnciclopedia.paginate :all, :page => params[:page], :per_page => 10,  :joins => [:identificacao,:localizacao], :conditions => ["identificacaos.livro like ? and tipo =? and localizacoes.unidade_id = ?", "%" + params[:search].to_s + "%","OUTROS",current_user.unidade_id], :order => 'livro ASC'
              render :update do |page|
                page.replace_html 'dicionarios', :partial => "dicionarios"
              end
            end
          end
      end
   end
end





  def index
    @dicionario_enciclopedias = DicionarioEnciclopedia.paginate :page => params[:page], :per_page => 10, :joins => :identificacao, :order => 'livro ASC'
  end

  def show
    @dicionario_enciclopedia = DicionarioEnciclopedia.find(params[:id])
  end

  def new
    @dicionario_enciclopedia = DicionarioEnciclopedia.new
  end

  def create
    qtd = params[:dicionario_enciclopedia][:qtde].to_i
    if qtd == 0
      qtd = 1
    end
    tombos = params[:dicionario_enciclopedia][:lista_tombos].split(";")
      i = 0
      @livros_cad = []
      qtd.times do
        @dicionario_enciclopedia = DicionarioEnciclopedia.new(params[:dicionario_enciclopedia])
        @dicionario_enciclopedia.identificacao_id = session[:identificacao_id]
        @dicionario_enciclopedia.usuario = current_user.id
        @dicionario_enciclopedia.unidade = current_user.unidade_id
#        Log.gera_log("CRIACAO", "DICIONARIO", current_user.id,@dicionario_enciclopedia.id)
        if params[:dicionario_enciclopedia][:qtde].to_i == 0
          @dicionario_enciclopedia.qtde = 1
        else
          @dicionario_enciclopedia.qtde = params[:dicionario_enciclopedia][:qtde].to_i
        end

        @dicionario_enciclopedia.tombo_l = tombos[i]
        #@livros_cad << @livro.tombo_l
        @dicionario_enciclopedia.save
        i += 1
      end
      session[:identificacao_id] = nil
        redirect_to de_cadastrados_dicionario_enciclopedias_path
      #render :action => 'livros_cadastrados', :collection => @






    #@dicionario_enciclopedia = DicionarioEnciclopedia.new(params[:dicionario_enciclopedia])
    #@dicionario_enciclopedia.identificacao_id = session[:identificacao_id]
    #session[:identificacao_id] = nil
    #@dicionario_enciclopedia.tombo_seduc = 1
    #if @dicionario_enciclopedia.save
    #  flash[:notice] = "CADASTRADO COM SUCESSO."
    #  redirect_to @dicionario_enciclopedia
    #else
    #  render :action => 'new'
    #end
  end

  def de_cadastrados
    limit = Tombo.last(:conditions => ["user_id = ? and dicionario_enciclopedia_id is not null", current_user])
    @de_cad = Tombo.all(:conditions => ["user_id = ? and dicionario_enciclopedia_id is not null", current_user], :limit => limit.qtde_livro, :order => "id DESC")
    t = 0
  end

  def create_editora
      @editora = Editora.new(params[:editora])
      if @editora.save
        @livro = Livro.new
        render :update do |page|
          page.replace_html 'editora', :partial => "shared/campos/campos_editora"
          page.replace_html 'aviso', :text => "EDITORA CADASTRADA, CONTINUE O CADASTRO. LEMBRE-SE DE SELECIONAR A EDITORA"
        end

      end

    end


def create_local
    @localizacao = Localizacao.new(params[:localizacao])
    @localizacao.add_unidade(current_user.unidade_id)
    if @localizacao.save
      @localizacoes = Localizacao.all(:conditions => ["unidade_id = ?", current_user.unidade_id])
      @dicionario_enciclopedia = DicionarioEnciclopedia.new
      render :update do |page|
        page.replace_html 'local', :partial => "shared/campos/campos_local"
        page.replace_html 'aviso', :text => "NOVO DICIONÁRIO & ENCICLOPÉDIA CADASTRADO, CONTINUE O CADASTRO"
      end

    end
  end


  

  def edit
    @dicionario_enciclopedia = DicionarioEnciclopedia.find(params[:id])
  end

  def update
    @dicionario_enciclopedia = DicionarioEnciclopedia.find(params[:id])
    if @dicionario_enciclopedia.update_attributes(params[:dicionario_enciclopedia])
      flash[:notice] = "CADASTRADO COM SUCESSO."
      redirect_to @dicionario_enciclopedia
    else
      render :action => 'edit'
    end
  end

  def destroy
    @dicionario_enciclopedia = DicionarioEnciclopedia.find(params[:id])
    @dicionario_enciclopedia.destroy
    flash[:notice] = "EXCLUIDO COM SUCESSO."
    redirect_to dicionario_enciclopedias_url
  end

 def subtitulo
  session[:identificacao] = params[:dicionario_enciclopedia_identificacao_id]
   @identificacao = Identificacao.find_by_id(session[:identificacao]).subtitulo
   render :partial => 'subtitulo'
   end


def filtrar
    if params[:busca].present?
      @identificacoes = Identificacao.all(:conditions =>["livro like ?", params[:busca][:busca]+"%"])
    end
      render :update do |page|
        page.replace_html 'lista_dicionarios', :partial => "lista_dicionarios"
      end
  end


 def return
      session[:identificacao_id] = params[:selected]
      @identificacao = Identificacao.find(params[:selected])
      render :update do |page|
        page.replace_html 'identificacao', :text => @identificacao.livro
        page.replace_html 'subtitulo', :text => "<b>Subtitulo: </b>#{@identificacao.subtitulo}"
      end
  end


    protected

  def load_resources
    @areas = Area.all(:order => 'nome ASC')
    @editoras = Editora.all(:order => 'nome ASC')
    @localizacoes = Localizacao.all(:order => 'local_guardado ASC')
    @identificacoes  = Identificacao.all(:order => 'livro ASC')
  end

end
